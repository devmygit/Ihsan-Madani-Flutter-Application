import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madani/src/index.dart';

// Pie chart configuration constants
class _PieChartConfig {
  // Start angle: -90 degrees = 12 o'clock position
  static const double startDegreeOffset = -90;
  
  // Border configuration
  static const Color borderColor = MadaniColor.white;
  static const double borderWidth = 0.5;
}

class PieChartWidget extends StatefulWidget {
  final Map<String, dynamic> pieChartData;
  final List<InitiativeModel> allArticles;
  final Function(List<InitiativeModel>)? onFilterChanged;
  final Function(String?)? onKategoriSelected;

  const PieChartWidget({
    super.key,
    required this.pieChartData,
    required this.allArticles,
    this.onFilterChanged,
    this.onKategoriSelected,
  });

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  String? _selectedCluster;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionsBloc, QuestionsState>(
      builder: (context, state) {
        return BlocListener<QuestionsBloc, QuestionsState>(
          listener: (context, state) {
            // When articles are loaded from API, update filtered results
            // This happens when kategori button is clicked and API returns articles
            if (state.status == QuestionStatus.searchResults && 
                state.searchResults.isNotEmpty &&
                _selectedCluster != null) {
              log('LOGAPP PIE: Articles loaded from API - Count: ${state.searchResults.length}, Selected Cluster: $_selectedCluster');
              widget.onFilterChanged?.call(state.searchResults);
            }
          },
          child: _buildPieChart(context),
        );
      },
    );
  }

  Widget _buildPieChart(BuildContext context) {
    try {
      // Check for new API format (data object with cluster counts)
      final data = widget.pieChartData['data'] as Map<String, dynamic>?;
      final jumlahDitemui = widget.pieChartData['jumlah_ditemui'] as int? ?? 0;
      
      // Check for old API format (pager and rows)
      final pager = widget.pieChartData['pager'] as Map<String, dynamic>?;
      final totalItems = pager?['total_items'] as int? ?? 0;
      final rows = widget.pieChartData['rows'] as List<dynamic>? ?? [];

      // Handle new API format
      if (data != null && data.isNotEmpty) {
        final clusterCounts = data.map((key, value) => MapEntry(key, (value as num).toInt()));
        final totalCount = jumlahDitemui > 0 ? jumlahDitemui : clusterCounts.values.fold(0, (sum, count) => sum + count);

        if (totalCount == 0) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 20.h),
            child: Text(
              'Tiada data untuk dipaparkan',
              style: TextStyleMadani.textStyle.interText.copyWith(
                fontSize: 16.sp,
                color: MadaniColor.grey3,
              ),
              textAlign: TextAlign.center,
            ),
          );
        }

        // Create pie chart sections for each cluster
        final List<PieChartSectionData> sections = clusterCounts.entries.map((entry) {
          final clusterName = entry.key;
          final count = entry.value;
          final percentage = (count / totalCount * 100).toStringAsFixed(0);
          
          return PieChartSectionData(
            color: _getColorForCluster(clusterName),
            value: count.toDouble(),
            title: '$count',
            radius: 140,
            titleStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: MadaniColor.white,
            ),
            titlePositionPercentageOffset: 0.7,
            borderSide: const BorderSide(
              color: _PieChartConfig.borderColor,
              width: _PieChartConfig.borderWidth,
            ),
          );
        }).toList();

        // Build legend items as tags with tap functionality
        final List<Widget> legendItems = clusterCounts.entries.map((entry) {
          final clusterName = entry.key;
          final count = entry.value;
          final clusterColor = _getColorForCluster(clusterName);
          final isSelected = _selectedCluster == clusterName;
          // If no cluster selected, all are active (colored). If one is selected, only that one is active.
          final isActive = _selectedCluster == null || isSelected;
          // Display label: "Utama" for non-main clusters, actual name for main clusters
          final displayLabel = _isMainCluster(clusterName) ? clusterName : 'Utama';
          
          return GestureDetector(
            onTap: () {
              setState(() {
                if (_selectedCluster == clusterName) {
                  // Deselect if already selected - show all articles
                  _selectedCluster = null;
                  widget.onFilterChanged?.call(widget.allArticles);
                  widget.onKategoriSelected?.call(null);
                } else {
                  // Select new cluster - call API to get articles for this kategori
                  _selectedCluster = clusterName;
                  widget.onKategoriSelected?.call(clusterName);
                  
                  // Dispatch event to get articles by kategori
                  context.read<QuestionsBloc>().add(
                    GetArticlesByKategori(kategori: clusterName),
                  );
                  
                  // Note: onFilterChanged will be called when bloc updates state
                  // The result_page will listen to state changes and update filtered results
                }
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isActive ? clusterColor : Colors.grey,
                  width: 1.0,
                ),
                color: MadaniColor.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    displayLabel,
                    style: TextStyleMadani.textStyle.interText.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: isActive ? clusterColor : Colors.grey,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Container(
                    width: 24.w,
                    height: 24.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isActive ? clusterColor : Colors.grey,
                    ),
                    child: Center(
                      child: Text(
                        count.toString(),
                        style: TextStyleMadani.textStyle.interText.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: MadaniColor.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList();

        return Container(
          padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.1, 0.h, MediaQuery.of(context).size.width * 0.1, 0.h),
          decoration: BoxDecoration(
            color: MadaniColor.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: 350.h,
                  width: 350.w,
                  child: PieChart(
                    PieChartData(
                      sections: sections,
                      sectionsSpace: 0,
                      centerSpaceRadius: 0,
                      startDegreeOffset: _PieChartConfig.startDegreeOffset,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: legendItems,
                ),
              ),
              SizedBox(height: 20.h),
              // Text(
              //   'Jumlah Inisiatif dan Bantuan',
              //   style: TextStyleMadani.textStyle.interText.copyWith(
              //     fontSize: 18.sp,
              //     fontWeight: FontWeight.w600,
              //     color: MadaniColor.black,
              //   ),
              //   textAlign: TextAlign.center,
              // ),
              // SizedBox(height: 8.h),
              // Text(
              //   '$totalCount ditemui',
              //   style: TextStyleMadani.textStyle.interText.copyWith(
              //     fontSize: 24.sp,
              //     fontWeight: FontWeight.bold,
              //     color: MadaniColor.primaryColor,
              //   ),
              //   textAlign: TextAlign.center,
              // ),
            ],
          ),
        );
      }

      // Handle old API format
      if (totalItems == 0 && rows.isEmpty) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 20.h),
          child: Text(
            'Tiada data untuk dipaparkan',
            style: TextStyleMadani.textStyle.interText.copyWith(
              fontSize: 16.sp,
              color: MadaniColor.grey3,
            ),
            textAlign: TextAlign.center,
          ),
        );
      }

      // Get total submissions count
      final int totalSubmissions = rows.isNotEmpty ? rows.length : totalItems;

      // Get theme color from AccessibilityCubit
      final accessibilityState = context.watch<AccessibilityCubit>().state;
      final themeColor = accessibilityState.resetColor
          ? getThemePrimaryColor(0)
          : getThemePrimaryColor(accessibilityState.indexColor);
      
      // Create pie chart showing total submissions
      // Since we only have total count, show as single segment
      final List<PieChartSectionData> sections = [
        PieChartSectionData(
          color: themeColor,
          value: totalSubmissions.toDouble(),
          title: '$totalSubmissions',
          radius: 100,
          titleStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: MadaniColor.white,
          ),
          borderSide: const BorderSide(
            color: _PieChartConfig.borderColor,
            width: _PieChartConfig.borderWidth,
          ),
        ),
      ];

      return Container(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 20.h),
        decoration: BoxDecoration(
          color: MadaniColor.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 220.h,
              width: 220.w,
              child: PieChart(
                PieChartData(
                  sections: sections,
                  sectionsSpace: 0,
                  centerSpaceRadius: 60,
                  startDegreeOffset: _PieChartConfig.startDegreeOffset,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Jumlah profil yang sepadan',
              style: TextStyleMadani.textStyle.interText.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: MadaniColor.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              '$totalSubmissions orang',
              style: TextStyleMadani.textStyle.interText.copyWith(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: themeColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    } catch (e, stackTrace) {
      log('Error building pie chart: $e\n$stackTrace', error: e);
      return Container(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 20.h),
        child: Text(
          'Ralat memaparkan carta',
          style: TextStyleMadani.textStyle.interText.copyWith(
            fontSize: 16.sp,
            color: Colors.red,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
  }

  bool _isMainCluster(String clusterName) {
    final upperName = clusterName.toUpperCase();
    switch (upperName) {
      case 'UMUM':
      case 'KESIHATAN':
      case 'MAKANAN':
      case 'PENDAPATAN':
      case 'PENDIDIKAN':
      case 'PENGANGKUTAN':
      case 'PERUMAHAN':
      case 'UTILITI':
        return true;
      default:
        return false;
    }
  }

  Color _getColorForCluster(String clusterName) {
    final upperName = clusterName.toUpperCase();
    switch (upperName) {
      case 'UMUM':
        return const Color(0xFF1E40AF); // Blue
      case 'KESIHATAN':
        return const Color(0xFF115E59); // Dark Teal/Green
      case 'MAKANAN':
        return const Color(0xFFB91C1C); // Red
      case 'PENDAPATAN':
        return const Color(0xFF01A7AC); // Teal
      case 'PENDIDIKAN':
        return const Color(0xFF6B21A8); // Purple
      case 'PENGANGKUTAN':
        return const Color(0xFFB91C1C); // Red
      case 'PERUMAHAN':
        return const Color(0xFFD34502); // Orange
      case 'UTILITI':
        return const Color(0xFF00ACD0); // Light Blue/Cyan
      default:
        return MadaniColor.black;
    }
  }
}


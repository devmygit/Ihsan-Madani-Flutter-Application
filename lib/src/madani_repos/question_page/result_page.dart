// import 'dart:developer';

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madani/src/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String? _expandedCluster;
  List<InitiativeModel> _filteredResults = [];
  bool _hasShownPenafian = false; // Flag to track if penafian has been shown
  String? _selectedKategori; // Track selected kategori from chart
  bool _hasAutoSelectedFirstCategory = false; // Flag to track if first category has been auto-selected
  final ScrollController _scrollController = ScrollController();
  bool _showGoUpButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    try {
      final shouldShow = _scrollController.hasClients && 
                         _scrollController.offset > 200;
      if (shouldShow != _showGoUpButton) {
        setState(() {
          _showGoUpButton = shouldShow;
        });
      }
    } catch (e) {
      log('Error in scroll listener: $e');
    }
  }

  void _scrollToTop() {
    try {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    } catch (e) {
      log('Error scrolling to top: $e');
    }
  }

  Widget _buildClusterChip({
    required String clusterName,
    required int count,
  }) {
    final displayLabel = _isMainCluster(clusterName) ? clusterName : 'Utama';
    final clusterColor = _getCategoryColor(clusterName);
    final isSelected = _selectedKategori == clusterName;

    final borderColor = isSelected ? clusterColor : Colors.grey;
    final textColor = isSelected ? clusterColor : Colors.grey;
    final badgeColor = isSelected ? clusterColor : Colors.grey;

    return GestureDetector(
      onTap: () {
        try {
          setState(() {
            if (_selectedKategori == clusterName) {
              // Unselect kategori
              _selectedKategori = null;
              _filteredResults = [];
            } else {
              // Select kategori and trigger API filter
              _selectedKategori = clusterName;
            }
          });

          if (_selectedKategori != null) {
            context
                .read<QuestionsBloc>()
                .add(GetArticlesByKategori(kategori: clusterName));
          }
        } catch (e) {
          log('Error selecting kategori: $e');
        }
      },
      child: Container(
        margin: EdgeInsets.only(right: 12.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
          color: MadaniColor.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              displayLabel,
              style: TextStyleMadani.textStyle.interText.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
            SizedBox(width: 8.w),
            Container(
              width: 28.w,
              height: 28.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: badgeColor,
              ),
              child: Center(
                child: Text(
                  count.toString(),
                  style: TextStyleMadani.textStyle.interText.copyWith(
                    fontSize: 14.sp,
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

  Color _getCategoryColor(String category) {
    switch (category.toUpperCase()) {
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

  String _cleanDescription(String description) {
    try {
      // Remove HTML tags
      String cleaned = description.replaceAll(RegExp(r'<[^>]*>'), '');
      
      // Remove HTML entities
      cleaned = cleaned
          .replaceAll('&nbsp;', ' ')
          .replaceAll('&lt;', '<')
          .replaceAll('&gt;', '>')
          .replaceAll('&amp;', '&')
          .replaceAll('&quot;', '"')
          .replaceAll('&#39;', "'")
          .replaceAll('\\/', '/');
      
      // Remove "Keterangan:" and everything before it (case insensitive)
      final keteranganIndex = cleaned.toLowerCase().indexOf('keterangan:');
      if (keteranganIndex != -1) {
        cleaned = cleaned.substring(keteranganIndex + 'keterangan:'.length).trim();
      }
      
      // Clean up multiple spaces and newlines
      cleaned = cleaned.replaceAll(RegExp(r'\s+'), ' ').trim();
      
      return cleaned;
    } catch (e) {
      return description;
    }
  }

  Widget _buildInisiatifCard({
    required String category,
    required String title,
    required String description,
    required Color categoryColor,
    required VoidCallback onTap,
  }) {
    final categoryText = category.isNotEmpty
        ? category[0].toUpperCase() + category.substring(1).toLowerCase()
        : category;
    
    final cleanedDescription = _cleanDescription(description);

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Box with category and title
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 15.h),
                decoration: BoxDecoration(
                  color: MadaniColor.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: categoryColor,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Category text
                    Text(
                      categoryText.toUpperCase(),
                      style: TextStyleMadani.textStyle.interText.copyWith(
                        fontSize: 16.sp,
                        color: categoryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Title
                    Text(
                      title,
                      style: TextStyleMadani.textStyle.interText.copyWith(
                        fontSize: 20.sp,
                        color: MadaniColor.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.h),
            // Description outside box
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Text(
                cleanedDescription,
                style: TextStyleMadani.textStyle.interText.copyWith(
                  fontSize: 18.sp,
                  color: MadaniColor.black.withOpacity(0.7),
                  height: 1.5,
                ),
              ),
            ),
            // Add extra space at bottom to prevent button from covering text
            SizedBox(height: 10.h),
          ],
        ),
        // Floating arrow button at bottom right (near description)
        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: 30.w, // Match homepage size
              height: 30.w,
              decoration: BoxDecoration(
                color: MadaniColor.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_forward,
                  color: const Color(0xFFEC1C7C),
                  size: 20.sp, // Match homepage size
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> penafian() async {
    return showAdaptiveDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              constraints: BoxConstraints(
                maxHeight: 300.h,
                maxWidth: 400.w,
              ),
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 20.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'PENAFIAN',
                    style: TextStyleMadani.textStyle.interAppbar.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Text(
                        'Kelayakan bagi inisiatif dan bantuan adalah berbentuk umum dan tertakluk kepada kriteria spesifik kumpulan sasar yang ditetapkan oleh agensi berkaitan.',
                        style: TextStyleMadani.textStyle.bodyMedium.copyWith(
                          color: MadaniColor.grey3,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  ElevatedButton(
                    onPressed: () =>
                        Navigator.of(context, rootNavigator: true).pop(),
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1),
                      )),
                      backgroundColor: WidgetStateProperty.all<Color>(
                          context
                                  .watch<AccessibilityCubit>()
                                  .state
                                  .resetColor
                              ? getThemePrimaryColor(0)
                              : getThemePrimaryColor(context
                                  .watch<AccessibilityCubit>()
                                  .state
                                  .indexColor)),
                      padding: WidgetStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 40.w, vertical: 12.h),
                      ),
                    ),
                    child: Text(
                      'OKAY',
                      style: TextStyleMadani.textStyle.cardButton.copyWith(
                        color: MadaniColor.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuestionsBloc, QuestionsState>(
      listener: (context, state) {
        log('LOGAPP RESULT: Listener triggered - Status: ${state.status}, Search Results Count: ${state.searchResults.length}');
        if (state.status == QuestionStatus.searchResults) {
          // Show penafian only on first load (when result page first appears with initial search results)
          // Don't show penafian when kategori button is clicked (articles update)
          // if (!_hasShownPenafian && _filteredResults.isEmpty && state.searchResults.isNotEmpty) {
          //   _hasShownPenafian = true;
          //   // Show penafian dialog only on initial load
          //   WidgetsBinding.instance.addPostFrameCallback((_) {
          //     penafian();
          //   });
          // }
          // Update filtered results only when kategori is selected.
          // When tiada kategori dipilih, senarai dibiarkan kosong.
          log('LOGAPP RESULT: Updating filtered results - Current: ${_filteredResults.length}, New: ${state.searchResults.length}, SelectedKategori: $_selectedKategori');
          setState(() {
            if (_selectedKategori != null) {
              _filteredResults = state.searchResults;
            } else {
              _filteredResults = [];
            }
          });
          log('LOGAPP RESULT: Filtered results updated - New count: ${_filteredResults.length}');
        }
      },
      builder: (context, state) {
        // Auto-select first category bila ada item inisiatif dan belum auto-select
        // Check dalam builder untuk pastikan data dah ready
        if (!_hasAutoSelectedFirstCategory && 
            state.pieChartData != null && 
            state.pieChartData!['data'] != null &&
            state.pieChartData!['data'] is Map<String, dynamic> &&
            _selectedKategori == null) {
          final data = state.pieChartData!['data'] as Map<String, dynamic>;
          log('LOGAPP RESULT: Checking auto-select - hasAutoSelected: $_hasAutoSelectedFirstCategory, data.isEmpty: ${data.isEmpty}, selectedKategori: $_selectedKategori');
          if (data.isNotEmpty) {
            final firstCategory = data.keys.first;
            log('LOGAPP RESULT: Found first category: $firstCategory, total categories: ${data.length}');
            // Use addPostFrameCallback untuk pastikan build cycle complete
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!mounted || _hasAutoSelectedFirstCategory) return;
              log('LOGAPP RESULT: Auto-selecting first category in builder: $firstCategory');
              setState(() {
                _hasAutoSelectedFirstCategory = true;
                _selectedKategori = firstCategory;
              });
              // Trigger API call untuk filter results
              context.read<QuestionsBloc>().add(
                GetArticlesByKategori(kategori: firstCategory),
              );
            });
          }
        }
        
        final groupedResults = state.searchResults.isNotEmpty
            ? groupBy(state.searchResults, (result) => result.cluster)
            : <String, List<InitiativeModel>>{};
        
        // Determine if we should show the "Pilih kategori" message
        // Show if: no kategori selected and list is empty
        // This applies to both first load and after unselecting
        final shouldShowPilihKategoriMessage = _selectedKategori == null && 
                                             _filteredResults.isEmpty;


        // final dataSource = groupedResults.entries
        //     .map((entry) => MapEntry(
        //         entry.key, entry.value.map((model) => model.cluster).toList()))
        //     .toList();

        return Scaffold(
          backgroundColor: MadaniColor.white,
          appBar: AppBar(
            backgroundColor: context
                    .watch<AccessibilityCubit>()
                    .state
                    .resetColor
                ? getThemeDarkColor(0)
                : getThemeDarkColor(context
                    .watch<AccessibilityCubit>()
                    .state
                    .indexColor), // Dark theme color
            centerTitle: true,
            title: Text(
              'Inisiatif dan Bantuan',
              style: TextStyleMadani.textStyle.interAppbar.copyWith(
                color: MadaniColor.white,
              ),
            ),
            leading: IconButton(
              onPressed: () {
                // Pop from current navigator (QuestionPageStartPage navigator)
                // fullscreenDialog will handle hiding bottom menu
                // Reset status to initial before popping to prevent navigation trigger
                log('LOGAPP RESULT: Back button pressed - Resetting status and popping result page');
                context.read<QuestionsBloc>().add(ResetStatus());
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop(true); // Pop with result to notify question page
                }
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: MadaniColor.white,
              ),
            ),
          ),
          body: Stack(
            children: [
              CustomScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  // Header section with summary text
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1,
                        vertical: 16.h,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Kami menemui',
                            style: TextStyleMadani.textStyle.interText.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: MadaniColor.black,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/bantuan-icon.svg',
                                height: 50.h,
                                width: 50.w,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                '${state.pieChartData != null && state.pieChartData!['jumlah_ditemui'] != null ? state.pieChartData!['jumlah_ditemui'] : state.searchResults.length}',
                                style: TextStyleMadani.textStyle.interText.copyWith(
                                  color: const Color(0xFF13097A),
                                  fontSize: 60.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'inisiatif dan bantuan',
                            style: TextStyleMadani.textStyle.interText.copyWith(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF13097A),
                            ),
                          ),
                          Text(
                            'yang bersesuaian untuk anda',
                            style: TextStyleMadani.textStyle.interText.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: MadaniColor.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Pilihan Kluster section - Sticky/Pinned header
                  if (state.pieChartData != null &&
                      state.pieChartData!['data'] != null &&
                      state.pieChartData!['data'] is Map<String, dynamic>)
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _PilihanKlusterHeaderDelegate(
                        pieChartData: state.pieChartData!['data'] as Map<String, dynamic>,
                        selectedKategori: _selectedKategori,
                        onKategoriSelected: (String? kategori) {
                          setState(() {
                            if (_selectedKategori == kategori) {
                              _selectedKategori = null;
                              _filteredResults = [];
                            } else {
                              _selectedKategori = kategori;
                            }
                          });
                          if (_selectedKategori != null) {
                            context.read<QuestionsBloc>().add(
                              GetArticlesByKategori(kategori: kategori!),
                            );
                          }
                        },
                      ),
                    ),
                  // Content section with filtered results
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1,
                        vertical: 16.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h),
                  // Display filtered articles list below category buttons
                  // This list will update when kategori button is clicked
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Senarai Inisiatif dan Bantuan',
                        style: TextStyleMadani.textStyle.interText.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: MadaniColor.black,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      // Show loading indicator when status is loading (only when kategori is selected)
                      if (state.status == QuestionStatus.loading && _selectedKategori != null)
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(40.h),
                            child: Column(
                              children: [
                                CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    context
                                            .watch<AccessibilityCubit>()
                                            .state
                                            .resetColor
                                        ? getThemePrimaryColor(0)
                                        : getThemePrimaryColor(context
                                            .watch<AccessibilityCubit>()
                                            .state
                                            .indexColor),
                                  ),
                                ),
                                SizedBox(height: 16.h),
                                Text(
                                  'Memuatkan...',
                                  style: TextStyleMadani.textStyle.interText.copyWith(
                                    fontSize: 16.sp,
                                    color: MadaniColor.grey3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      // Show message if no kategori selected
                      // This includes first load (no kategori selected yet) and after unselecting
                      // List should be empty when no kategori is selected
                      else if (shouldShowPilihKategoriMessage)
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(40.h),
                            child: Text(
                              'Pilih kategori di atas untuk memaparkan senarai inisiatif dan bantuan',
                              style: TextStyleMadani.textStyle.interText.copyWith(
                                fontSize: 16.sp,
                                color: MadaniColor.grey3,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      // Show list if has results
                      else if (_filteredResults.isNotEmpty)
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) => Divider(
                            height: 30.h,
                            thickness: 1,
                            color: Colors.grey[300],
                          ),
                          itemCount: _filteredResults.length,
                          itemBuilder: (context, index) {
                            final result = _filteredResults[index];
                            final categoryColor = _getCategoryColor(result.cluster);
                            final displayClusterName = _isMainCluster(result.cluster) 
                                ? result.cluster 
                                : 'Utama';
                            final categoryName = displayClusterName.isNotEmpty
                                ? displayClusterName[0].toUpperCase() +
                                    displayClusterName.substring(1).toLowerCase()
                                : displayClusterName;
                            
                            return _buildInisiatifCard(
                              category: categoryName,
                              title: result.name,
                              description: result.description,
                              categoryColor: categoryColor,
                              onTap: () {
                                // Use nid if available, otherwise use id
                                final id = (result.nid != null && result.nid!.isNotEmpty) 
                                    ? result.nid! 
                                    : result.id;
                                context.read<InitiativeBloc>().add(
                                      GetInitiativeDetails(id),
                                    );

                                // Use root navigator to push cluster detail page on top
                                // This will hide result_page but keep it in the stack
                                Navigator.of(context, rootNavigator: true).pushNamed(
                                  MadaniRoutes.klusterDetailRoute,
                                  arguments: {
                                    'appBarTitle': displayClusterName,
                                    'category': categoryName,
                                    'fromResultPage': true, // Flag to indicate navigation from result page
                                  },
                                );
                              },
                            );
                          },
                        )
                      // Show "Tiada hasil ditemui" only when kategori is selected but no results
                      else if (_selectedKategori != null && _filteredResults.isEmpty)
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(40.h),
                            child: Text(
                              'Tiada hasil ditemui',
                              style: TextStyleMadani.textStyle.interText.copyWith(
                                fontSize: 16.sp,
                                color: MadaniColor.grey3,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: groupedResults.entries.map((entry) {
                  //     return ResultKluster(
                  //       title: entry.key,
                  //       results: entry.value,
                  //       isExpanded: _expandedCluster == entry.key,
                  //       onTap: () {
                  //         setState(() {
                  //           if (_expandedCluster == entry.key) {
                  //             _expandedCluster = null; // Close the cluster
                  //           } else {
                  //             _expandedCluster = entry.key; // Open the cluster
                  //           }
                  //         });
                  //       },
                  //     );
                  //   }).toList(),
                  // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
        // Floating Go Up Button
        if (_showGoUpButton)
          Positioned(
            bottom: 20.h,
            right: 20.w,
            child: GestureDetector(
              onTap: _scrollToTop,
              child: SvgPicture.asset(
                'assets/images/go-up.svg',
                width: 48.w,
                height: 48.h,
              ),
            ),
          ),
      ],
    ),
  );
      },
    );
  }
}

class _PilihanKlusterHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Map<String, dynamic> pieChartData;
  final String? selectedKategori;
  final Function(String?) onKategoriSelected;
  final ScrollController _scrollController = ScrollController();
  String _lastScrolledKategori = ''; // Track last scrolled kategori
  final Map<int, GlobalKey> _chipKeys = {}; // Store keys for each chip to measure positions

  _PilihanKlusterHeaderDelegate({
    required this.pieChartData,
    required this.selectedKategori,
    required this.onKategoriSelected,
  });

  void _scrollToCenter(BuildContext context, int itemIndex) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;

      final screenWidth = MediaQuery.of(context).size.width;

      // Try to get actual widget position if key exists
      final chipKey = _chipKeys[itemIndex];
      if (chipKey != null && chipKey.currentContext != null) {
        final RenderBox? renderBox = chipKey.currentContext!.findRenderObject() as RenderBox?;
        if (renderBox != null) {
          // Get the position of the chip relative to the ListView
          final position = renderBox.localToGlobal(Offset.zero);
          final chipWidth = renderBox.size.width;

          // Calculate how much to scroll to center this chip
          // Current scroll position + chip left position - (screen center - chip center)
          final currentScroll = _scrollController.offset;
          final targetScroll = currentScroll + position.dx - (screenWidth / 2) + (chipWidth / 2);

          _scrollController.animateTo(
            targetScroll.clamp(
              0.0,
              _scrollController.position.maxScrollExtent,
            ),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
          return;
        }
      }

      // Fallback to estimation if measurement fails
      final estimatedChipWidth = screenWidth * 0.45;
      const chipSpacing = 12.0;
      final centerOffset = (estimatedChipWidth + chipSpacing) * itemIndex;

      _scrollController.animateTo(
        centerOffset.clamp(
          0.0,
          _scrollController.position.maxScrollExtent,
        ),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
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

  Color _getCategoryColor(String category) {
    switch (category.toUpperCase()) {
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

  Widget _buildClusterChip(BuildContext context, {
    required String clusterName,
    required int count,
    required int itemIndex,
    required GlobalKey chipKey,
  }) {
    final displayLabel = _isMainCluster(clusterName) ? clusterName : 'Utama';
    final clusterColor = _getCategoryColor(clusterName);
    final isSelected = selectedKategori == clusterName;

    final borderColor = isSelected ? clusterColor : Colors.grey;
    final textColor = isSelected ? clusterColor : Colors.grey;
    final badgeColor = isSelected ? clusterColor : Colors.grey;

    return GestureDetector(
      onTap: () {
        onKategoriSelected(isSelected ? null : clusterName);
        // Scroll will be handled by build method's auto-scroll logic
      },
      child: Container(
        key: chipKey,
        margin: EdgeInsets.only(right: 12.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
          color: MadaniColor.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              displayLabel,
              style: TextStyleMadani.textStyle.interText.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
            SizedBox(width: 8.w),
            Container(
              width: 28.w,
              height: 28.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: badgeColor,
              ),
              child: Center(
                child: Text(
                  count.toString(),
                  style: TextStyleMadani.textStyle.interText.copyWith(
                    fontSize: 14.sp,
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
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: const Color(0xFFEFEFEF),
      padding: EdgeInsets.only(top: 18.h, bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
            ),
            child: Text(
              'Pilihan Kluster',
              textAlign: TextAlign.center,
              style: TextStyleMadani.textStyle.interText.copyWith(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: MadaniColor.black,
              ),
            ),
          ),
          SizedBox(height: 15.h),
          SizedBox(
            height: 60.h,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final screenWidth = constraints.maxWidth;
                // Calculate approximate chip width (will be dynamic but this is a good estimate)
                // Use percentage of screen width for better accuracy across different screens
                final estimatedChipWidth = screenWidth * 0.45;
                final centerPadding = (screenWidth - estimatedChipWidth) / 2;

                // Auto-scroll to selected item (only if not already scrolled)
                if (selectedKategori != null && _lastScrolledKategori != selectedKategori) {
                  final selectedIndex = pieChartData.keys.toList().indexOf(selectedKategori!);
                  if (selectedIndex >= 0) {
                    _lastScrolledKategori = selectedKategori!;
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _scrollToCenter(context, selectedIndex);
                    });
                  }
                } else if (selectedKategori == null && pieChartData.isNotEmpty && _lastScrolledKategori.isEmpty) {
                  // Auto-center first item on initial load if no selection
                  _lastScrolledKategori = 'initial';
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _scrollToCenter(context, 0);
                  });
                }

                return ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: pieChartData.length + 2, // +2 for spacer items
                  itemBuilder: (context, index) {
                // First item: spacer to center first chip
                if (index == 0) {
                  return SizedBox(width: centerPadding);
                }
                // Last item: spacer to allow scroll to center last chip
                if (index == pieChartData.length + 1) {
                  return SizedBox(width: centerPadding);
                }
                // Actual chip items
                final actualIndex = index - 1;
                final entry = pieChartData.entries.elementAt(actualIndex);

                // Create or reuse GlobalKey for this chip
                _chipKeys.putIfAbsent(actualIndex, () => GlobalKey());

                return _buildClusterChip(
                  context,
                  clusterName: entry.key,
                  count: (entry.value as num).toInt(),
                  itemIndex: actualIndex,
                  chipKey: _chipKeys[actualIndex]!,
                );
              },
            );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 140.h; // Title + spacing + ListView height + padding

  @override
  double get minExtent => 140.h; // Same as maxExtent for fixed height

  @override
  bool shouldRebuild(_PilihanKlusterHeaderDelegate oldDelegate) {
    return oldDelegate.pieChartData != pieChartData ||
           oldDelegate.selectedKategori != selectedKategori;
  }
}

class ResultCluster extends StatelessWidget {
  const ResultCluster({
    super.key,
    required this.title,
    required this.results,
    required this.isExpanded,
    required this.onTap,
  });

  final String title;
  final List<InitiativeModel> results;
  final bool isExpanded;
  final VoidCallback onTap;

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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: 48.h,
            padding: EdgeInsets.only(left: 12.r),
            clipBehavior: Clip.antiAlias,
            decoration: const ShapeDecoration(
                color: Color(0xFFFDCA0A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 3),
                    spreadRadius: 2,
                  )
                ]),
            child: Row(
              children: [
                SizedBox(
                  child: Text(
                    title,
                    style: TextStyleMadani.textStyle.interText.copyWith(
                      color: context
                              .watch<AccessibilityCubit>()
                              .state
                              .resetColor
                          ? getThemePrimaryColor(0)
                          : getThemePrimaryColor(context
                              .watch<AccessibilityCubit>()
                              .state
                              .indexColor),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  width: 130,
                  height: 60,
                  padding: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    color: context
                            .watch<AccessibilityCubit>()
                            .state
                            .resetColor
                        ? getThemePrimaryColor(0)
                        : getThemePrimaryColor(context
                            .watch<AccessibilityCubit>()
                            .state
                            .indexColor),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100.r),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 2,
                        offset: Offset(-5, 1),
                        spreadRadius: -1,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: 24,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          results.length.toString(),
                          style: TextStyleMadani.textStyle.interText.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_up_outlined
                            : Icons.keyboard_arrow_down_outlined,
                        color: MadaniColor.white,
                      )
                    ],
                  ),
                )
                // Container(
                //   alignment: Alignment.center,
                //   width: 50,
                //   height: 24,
                //   padding: const EdgeInsets.symmetric(horizontal: 15),
                //   clipBehavior: Clip.antiAlias,
                //   decoration: ShapeDecoration(
                //     color: Colors.white,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(5),
                //     ),
                //   ),
                //   child: Text(
                //     results.length.toString(),
                //     style: TextStyleMadani.textStyle.interText.copyWith(
                //       fontWeight: FontWeight.w500,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   width: 10.w,
                // ),
                // Icon(
                //   isExpanded
                //       ? Icons.keyboard_arrow_up_outlined
                //       : Icons.keyboard_arrow_down_outlined,
                //   color: MadaniColor.white,
                // )
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          if (isExpanded)
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(height: 20.h),
              itemCount: results.length,
              itemBuilder: (context, i) {
                return ClusterCard(
                  title: results[i].name,
                  description: results[i].description,
                  onPressed: () {
                    // Use nid if available, otherwise use id
                    final id = (results[i].nid != null && results[i].nid!.isNotEmpty) 
                        ? results[i].nid! 
                        : results[i].id;
                    context
                        .read<InitiativeBloc>()
                        .add(GetInitiativeDetails(id));

                    if (context.read<InitiativeBloc>().state.status ==
                        InitiativeStatus.initial) {
                      final displayClusterName = _isMainCluster(results[i].cluster) 
                          ? results[i].cluster 
                          : 'Utama';
                      Navigator.of(context).pushNamed(
                          MadaniRoutes.klusterDetailRoute,
                          arguments: {
                            'appBarTitle': displayClusterName,
                          });
                    }
                  },
                );
              },
            ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}

class LeftSemiCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, size.height / 2);
    path.arcToPoint(
      Offset(0, size.height / 2),
      radius: Radius.circular(size.height / 2),
      clockwise: false,
    );
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

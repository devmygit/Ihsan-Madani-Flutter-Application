import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:madani/src/index.dart';

// Pie chart configuration constants
class _PieChartConfig {
  // Start angle: -90 degrees = 12 o'clock position
  static const double startDegreeOffset = -90;
  
  // Border configuration
  static const Color borderColor = MadaniColor.white;
  static const double borderWidth = 0.5;
}

class ResponsivePieChart extends StatefulWidget {
  final Map<String, List<InitiativeModel>> groupedResult;
  final Function(List<InitiativeModel>)? onResultsUpdated;

  const ResponsivePieChart({
    Key? key,
    required this.groupedResult,
    this.onResultsUpdated,
  }) : super(key: key);

  @override
  State<ResponsivePieChart> createState() => _ResponsivePieChartState();
}

class _ResponsivePieChartState extends State<ResponsivePieChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final List<Widget> legendItems = widget.groupedResult.entries.map((entry) {
      final String title = entry.key.replaceAll('Kluster', '');
      final List<InitiativeModel> initiatives = entry.value;

      return InkWell(
        onTap: () {
          setState(() {
            touchedIndex =
                widget.groupedResult.keys.toList().indexOf(entry.key);
          });
          widget.onResultsUpdated?.call(initiatives);
        },
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: getColorForCluster(entry.key),
                ),
              ),
              const SizedBox(width: 3),
              Text(
                '$title: ${initiatives.length}',
                softWrap: true,
                style: TextStyle(
                  color: touchedIndex ==
                          widget.groupedResult.keys.toList().indexOf(entry.key)
                      ? Colors.black
                      : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      );
    }).toList();

    return Column(
      children: [
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 7,
          children: legendItems,
        ),
        const SizedBox(height: 20),
        AspectRatio(
          aspectRatio: 1.3,
          child: AspectRatio(
            aspectRatio: 1,
            child: Stack(
              children: [
                // Positioned.fill(
                //   child: Padding(
                //     padding:
                //         const EdgeInsets.all(20.0), // Adjust padding as needed
                //     child: Container(
                //       decoration: BoxDecoration(
                //         shape: BoxShape.circle,
                //         // border: Border.all(
                //         //   color: MadaniColor.primaryColor.withOpacity(0.2),
                //         //   width: 5.0,
                //         // ),
                //         boxShadow: [
                //           BoxShadow(
                //             color: MadaniColor.black.withOpacity(0.22),
                //             spreadRadius: 4,
                //             blurRadius: 10,
                //             offset: const Offset(-5, -3),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (event, pieTouchResponse) {
                        setState(() {
                          if (event is FlLongPressEnd) {
                            touchedIndex = -1;
                          } else {
                            touchedIndex = pieTouchResponse
                                    ?.touchedSection?.touchedSectionIndex ??
                                -1;
                          }
                        });

                        if (touchedIndex != -1) {
                          final selectedCluster = widget.groupedResult.entries
                              .toList()[touchedIndex];
                          widget.onResultsUpdated?.call(selectedCluster.value);
                        }
                      },
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 0,
                    startDegreeOffset: _PieChartConfig.startDegreeOffset,
                    sections: showingSections(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    final List<String> keys = widget.groupedResult.keys.toList();

    return widget.groupedResult.entries.map((entry) {
      final List<InitiativeModel> initiatives = entry.value;
      final kluster = entry.key.replaceAll('Kluster', '');

      final isTouched = keys.indexOf(entry.key) == touchedIndex;
      final double fontSize = isTouched ? 12.0 : 10.0;
      final double radius = isTouched ? 110.0 : 100.0;

      return PieChartSectionData(
        color: getColorForCluster(entry.key),
        value: initiatives.length.toDouble(),
        title: '${initiatives.length}',
        radius: radius,
        borderSide: const BorderSide(
          color: _PieChartConfig.borderColor,
          width: _PieChartConfig.borderWidth,
        ),
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: MadaniColor.white,
        ),
        titlePositionPercentageOffset: 0.6,
        showTitle: true,
      );
    }).toList();
  }

  Color getColorForCluster(String clusterName) {
    switch (clusterName) {
      case 'Kluster Pendapatan':
        return const Color(0xFF01A7AC); // Teal
      case 'Kluster Makanan':
        return const Color(0xFFB91C1C); // Red
      case 'Kluster Kesihatan':
        return const Color(0xFF115E59); // Dark Teal/Green
      case 'Kluster Pendidikan':
        return const Color(0xFF6B21A8); // Purple
      case 'Kluster Pengangkutan':
        return const Color(0xFFB91C1C); // Red
      case 'Kluster Utiliti':
        return const Color(0xFF00ACD0); // Light Blue/Cyan
      case 'Kluster Perumahan':
        return const Color(0xFFD34502); // Orange
      case 'Umum':
        return const Color(0xFF1E40AF); // Blue
      default:
        return Colors
            .grey; // Return a default color if the cluster name is not recognized
    }
  }
}

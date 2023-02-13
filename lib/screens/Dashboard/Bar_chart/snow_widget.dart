import 'package:farmadvisor/screens/Dashboard/Bar_chart/snow_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'bar_titles.dart';

class SnowWidget extends StatelessWidget {
  final double barWidth = 40;

  const SnowWidget({super.key});

  @override
  Widget build(BuildContext context) => BarChart(
        BarChartData(
          borderData: FlBorderData(show: false),
          alignment: BarChartAlignment.center,
          maxY: 10,
          minY: 0,
          groupsSpace: 0,
          barTouchData: BarTouchData(enabled: true),
          titlesData: FlTitlesData(
            topTitles: BarTitles.getTopBottomTitles(),
            bottomTitles: BarTitles.getLeft(),
            rightTitles: BarTitles.getLeft(),
            leftTitles: BarTitles.getSideTitles(),
          ),
          gridData: FlGridData(
              checkToShowHorizontalLine: (value) =>
                  value % SnowData.interval == 0,
              getDrawingHorizontalLine: (value) {
                if (value == 0) {
                  return FlLine(
                    color: const Color.fromARGB(187, 193, 194, 218),
                    strokeWidth: 0,
                  );
                } else {
                  return FlLine(
                    color: const Color.fromARGB(187, 202, 202, 212),
                    strokeWidth: 0.8,
                  );
                }
              },
              getDrawingVerticalLine: (value) {
                return FlLine(color: const Color.fromARGB(0, 255, 255, 255));
              }),
          barGroups: SnowData.snowData
              .map(
                (data) => BarChartGroupData(
                  x: data.id,
                  barRods: [
                    BarChartRodData(
                      y: data.y,
                      width: barWidth,
                      colors: [data.color],
                      borderRadius: data.y > 0
                          ? const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6),
                            )
                          : const BorderRadius.only(
                              bottomLeft: Radius.circular(6),
                              bottomRight: Radius.circular(6),
                            ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      );
}

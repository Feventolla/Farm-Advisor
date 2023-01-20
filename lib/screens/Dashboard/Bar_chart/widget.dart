// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:flutter/material.dart';

// import 'bar_chart_model.dart';

// class HomePage extends StatelessWidget {
//   HomePage({Key? key}) : super(key: key);
//   final List<BarChartModel> data = [
//     BarChartModel(
//       year: "2014",
//       financial: 250,
//       color: charts.ColorUtil.fromDartColor(Colors.blueGrey),
//     ),
//     BarChartModel(
//       year: "2015",
//       financial: 300,
//       color: charts.ColorUtil.fromDartColor(Colors.red),
//     ),
//     BarChartModel(
//       year: "2016",
//       financial: 100,
//       color: charts.ColorUtil.fromDartColor(Colors.green),
//     ),
//     BarChartModel(
//       year: "2017",
//       financial: 450,
//       color: charts.ColorUtil.fromDartColor(Colors.yellow),
//     ),
//     BarChartModel(
//       year: "2018",
//       financial: 630,
//       color: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
//     ),
//     BarChartModel(
//       year: "2019",
//       financial: 950,
//       color: charts.ColorUtil.fromDartColor(Colors.pink),
//     ),
//     BarChartModel(
//       year: "2020",
//       financial: 400,
//       color: charts.ColorUtil.fromDartColor(Colors.purple),
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     List<charts.Series<BarChartModel, String>> series = [
//       charts.Series(
//         id: "financial",
//         data: data,
//         domainFn: (BarChartModel series, _) => series.year,
//         measureFn: (BarChartModel series, _) => series.financial,
//         colorFn: (BarChartModel series, _) => series.color,
//       ),
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Bar Chart"),
//         centerTitle: true,
//         backgroundColor: Colors.green[700],
//       ),
//       body: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
//         child: charts.BarChart(
//           series,
//           animate: true,
//         ),
//       ),
//     );
//   }
// }

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:farmadvisor/screens/Dashboard/Bar_chart/data.dart';
import 'package:farmadvisor/screens/Dashboard/Bar_chart/bar_chart_model.dart';

import 'bar_titles.dart';

class BarChartWidget extends StatelessWidget {
  final double barWidth = 40;

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
                  value % BarData.interval == 0,
              getDrawingHorizontalLine: (value) {
                if (value == 0) {
                  return FlLine(
                    color: Color.fromARGB(187, 193, 194, 218),
                    strokeWidth: 0,
                  );
                } else {
                  return FlLine(
                    color: Color.fromARGB(187, 202, 202, 212),
                    strokeWidth: 0.8,
                  );
                }
              },
              getDrawingVerticalLine: (value) {
                return FlLine(color: Color.fromARGB(0, 255, 255, 255));
              }),
          barGroups: BarData.barData
              .map(
                (data) => BarChartGroupData(
                  x: data.id,
                  barRods: [
                    BarChartRodData(
                      y: data.y,
                      width: barWidth,
                      colors: [data.color],
                      borderRadius: data.y > 0
                          ? BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6),
                            )
                          : BorderRadius.only(
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

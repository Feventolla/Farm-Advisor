// import 'package:charts_flutter/flutter.dart' as charts;

// class BarChartModel {
//   String year;
//   int financial;
//   final charts.Color color;

//   BarChartModel({
//     required this.year,
//     required this.financial,
//     required this.color,
//   });
// }

import 'package:flutter/material.dart';

class Data {
  // for ordering in the graph
  final int id;
  final String name;
  final double y;
  final Color color;

  const Data({
    required this.name,
    required this.id,
    required this.y,
    required this.color,
  });
}

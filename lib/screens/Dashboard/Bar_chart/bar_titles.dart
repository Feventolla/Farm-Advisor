import 'package:farmadvisor/screens/Dashboard/Bar_chart/data.dart';
// import 'package:farmadvisor/screens/Dashboard/bar_chart_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarTitles {
  static SideTitles getTopBottomTitles() => SideTitles(
        showTitles: true,
        getTextStyles: (context, value) => const TextStyle(
          color: Color(0xFF20382F),
          fontSize: 12,
          fontWeight: FontWeight.w700,
          // wordSpacing: 1,
        ),

        // margin: 5,

        // getTitles: (double id) => BarData.barData
        //     .firstWhere((element) => element.id == id.toInt())
        //     .name,
        getTitles: (double id) =>
            "${BarData.barData.firstWhere((element) => element.id == id.toInt()).name} \n ${BarData.barData.firstWhere((element) => element.id == id.toInt()).day}\n ",
      );

  static SideTitles getSideTitles() => SideTitles(
        showTitles: true,
        getTextStyles: (context, value) => const TextStyle(
            color: Color(0xFF979797),
            fontSize: 10,
            fontWeight: FontWeight.w400),
        rotateAngle: 0,
        interval: BarData.interval.toDouble(),
        margin: 10,
        // reservedSize: 0,
        getTitles: (double value) => value == 0 ? '0' : '${value.toInt()}',
      );
  static SideTitles getLeft() => SideTitles(
        showTitles: false,
      );

  static SideTitles getBottomTitles() => SideTitles(
        showTitles: true,
        getTextStyles: (context, value) => const TextStyle(
            color: Color(0xFF979797),
            fontSize: 12,
            fontWeight: FontWeight.w700),
        // margin: 15,

        // getTitles: (double id) => BarData.barData
        //     .firstWhere((element) => element.id == id.toInt())
        //     .name,
      );
}

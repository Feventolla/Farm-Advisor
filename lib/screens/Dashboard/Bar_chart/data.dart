import 'package:flutter/material.dart';
import 'package:farmadvisor/screens/Dashboard/Bar_chart/bar_chart_model.dart';

class BarData {
  static int interval = 2;

  static List<Data> barData = [
    Data(
      id: 0,
      name: 'Mon',
      y: 0,
      color: Color(0xff2980B9),
    ),
    Data(
      name: 'Tue',
      id: 1,
      y: 1.3,
      color: Color(0xff2980B9),
    ),
    Data(
      name: 'Wed',
      id: 2,
      y: 0,
      color: Color(0xff2980B9),
    ),
    Data(
      name: 'Thu',
      id: 3,
      y: 0,
      color: Color(0xff6DACD6),
    ),
    Data(
      name: 'Fri',
      id: 4,
      y: 1.7,
      color: Color(0xff6DACD6),
    ),
    Data(
      name: 'Sat',
      id: 5,
      y: 3.7,
      color: Color(0xff2980B9),
    ),
    Data(
      name: 'Sun',
      id: 6,
      y: 5,
      color: Color(0xff2980B9),
    ),
    Data(
      name: 'Mon',
      id: 7,
      y: 0,
      color: Color(0xfff2980B9),
    ),
  ];
}

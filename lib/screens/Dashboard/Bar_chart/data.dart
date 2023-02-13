import 'package:flutter/material.dart';
import 'package:farmadvisor/screens/Dashboard/Bar_chart/bar_chart_model.dart';

class BarData {
  static int interval = 2;

  static List<Data> barData = [
    const Data(
      id: 0,
      name: 'Mon',
      day: 'Today ',
      y: 0,
      color: Color(0xff2980B9),
    ),
    const Data(
      name: "Tue",
      day: 'May 12 ',
      id: 1,
      y: 1.3,
      color: Color(0xff2980B9),
    ),
    const Data(
      name: 'Wed',
      day: 'May 13 ',
      id: 2,
      y: 0,
      color: Color(0xff2980B9),
    ),
    const Data(
      name: 'Tur',
      day: 'May 14 ',
      id: 3,
      y: 0,
      color: Color(0xff6DACD6),
    ),
    const Data(
      name: 'Fri',
      day: 'May 15 ',
      id: 4,
      y: 1.7,
      color: Color(0xff6DACD6),
    ),
    const Data(
      name: 'Sat',
      day: 'May 16 ',
      id: 5,
      y: 3.7,
      color: Color(0xff2980B9),
    ),
    const Data(
      name: 'Sun',
      day: 'May 17 ',
      id: 6,
      y: 5,
      color: Color(0xff2980B9),
    ),
    const Data(
      name: 'Mon',
      day: 'May 18 ',
      id: 7,
      y: 0,
      color: Color(0xff2980B9),
    ),
  ];
}

import 'package:farmadvisor/screens/Dashboard/Bar_chart/widget.dart';
import 'package:flutter/material.dart';

class BarChartPage extends StatelessWidget {
  const BarChartPage({super.key});

  @override
  Widget build(BuildContext context) => Card(
        // elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        color: const Color.fromARGB(255, 255, 255, 255),
        child: const Padding(
          padding: EdgeInsets.only(top: 16),
          child: BarChartWidget(),
        ),
      );
}

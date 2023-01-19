import 'package:farmadvisor/screens/Dashboard/Bar_chart/snow_widget.dart';
import 'package:flutter/material.dart';

class SnowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Card(
        // elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        color: Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: SnowWidget(),
        ),
      );
}

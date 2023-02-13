import 'package:flutter/material.dart';

class Data {
  // for ordering in the graph
  final int id;
  final String name;
  final String day;
  final double y;
  final Color color;

  const Data({
    required this.name,
    required this.day,
    required this.id,
    required this.y,
    required this.color,
  });
}

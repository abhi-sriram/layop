import 'package:flutter/material.dart';

class Data {
  final String type;
  final double precent;
  final Color color;
  Data({
    required this.type,
    required this.precent,
    required this.color,
  });
}

class PieAssData {
  static List<Data> assData = [

    Data(type: "devoir", precent: 40, color: const Color(0xffff0000)),
    Data(type: "examen", precent: 30, color: const Color.fromARGB(255, 23, 0, 228)),
    Data(type: "examen", precent: 30, color: const Color.fromARGB(255, 14, 78, 1)),
  ];
}

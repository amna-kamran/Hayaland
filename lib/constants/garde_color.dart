import 'package:flutter/material.dart';

class GradeColors {
  static Color getColorForGrade(String grade) {
    switch (grade) {
      case 'A':
        return Color.fromARGB(255, 253, 187, 209);
      case 'B':
        return const Color.fromARGB(255, 223, 132, 163);
      case 'C':
        return const Color.fromARGB(255, 239, 63, 122);
      case 'S':
        return Colors.red;
      case 'J':
        return Colors.grey;
      default:
        return Colors.red;
    }
  }
}

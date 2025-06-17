import 'package:flutter/material.dart';
import 'package:lol_app/app/utils/colors_app.dart';

String diff(int v) {
  if (v <= 4) return "Easy";
  if (v <= 7) return "Moderate";
  return "Hard";
}

Color diffColor(int v, int index) {
  if (v <= 4 && index < 1) {
    return ColorsApp.secondaryColor;
  } else if (v <= 7 && index <= 1) {
    return Colors.amber;
  } else if (v >= 8 && index <= 2) {
    return Colors.red;
  }
  return ColorsApp.secondaryColorDark;
}

import 'package:flutter/material.dart';
import 'package:lol_app/app/utils/colors_app.dart';

String diff(int v) {
  return v <= 4
      ? "Easy"
      : v > 4 && v <= 7
          ? "Moderate"
          : "Hard";
}

Color diffColor(int v, int index) {
  return v <= 4 && index < 1
      ? ColorsApp.secondaryColor
      : v > 4 && v <= 7 && index <= 1
          ? Colors.amber
          : v >= 8 && index <= 2
              ? Colors.red
              : ColorsApp.secondaryColorDark;
}

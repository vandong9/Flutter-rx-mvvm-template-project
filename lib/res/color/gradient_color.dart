import 'package:flutter/material.dart';
import 'color_data.dart';

class GradientColor {
  static final whiteToLightGray = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      ColorData.appColor.defaultColor,
      ColorData.appColor.defaultTextColor
    ],
    stops: [
      0.5,
      1.0,
    ],
  );
}

import 'package:ProjectTemplate/res/color/color_data.dart';
import 'package:ProjectTemplate/res/dimen.dart';
import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  final Color color;
  final double height;

  const HorizontalLine({Key key, this.color, this.height = Dimen.horizonLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: height, color: color ?? ColorData.appColor.line);
  }
}

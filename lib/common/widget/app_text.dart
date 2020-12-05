import 'package:ProjectTemplate/res/color/color_data.dart';
import 'package:ProjectTemplate/res/font/fonts_name.dart';
import 'package:ProjectTemplate/res/fonts_size.dart';
import 'package:flutter/widgets.dart';

class AppText extends StatelessWidget {
  final String text;
  final double textSize;
  final Color textColor;
  final double letterSpacing;
  final String font;
  final FontStyle fontStyle;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final Color bgColor;
  final int maxLines;
  final double lineSpacing;
  final TextStyle textStyle;
  final TextDecoration textDecoration;
  final TextOverflow textOverflow;

  AppText(
      {@required this.text,
      this.textSize,
      this.textColor,
      this.letterSpacing,
      this.font,
      this.fontStyle,
      this.fontWeight,
      this.textAlign,
      this.bgColor,
      this.maxLines,
      this.lineSpacing,
      this.textStyle,
      this.textDecoration,
      this.textOverflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: maxLines,
      style: textStyle ??
          TextStyle(
              letterSpacing: letterSpacing,
              height: lineSpacing,
              decoration: textDecoration,
              backgroundColor: bgColor,
              fontStyle: fontStyle,
              fontSize: textSize ?? FontsSize.regular,
              fontFamily: font ?? FontsName.appFont.regular,
              color: textColor ?? ColorData.appColor.primaryTextColor,
              fontWeight: fontWeight),
    );
  }
}

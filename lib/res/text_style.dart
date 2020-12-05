import 'package:ProjectTemplate/res/color/color_data.dart';
import 'package:ProjectTemplate/res/font/fonts_name.dart';
import 'package:ProjectTemplate/res/fonts_size.dart';
import 'package:flutter/material.dart';

class TextStyles {
  // static const TextStyle()
  static final TextStyle titleAppbar = TextStyle(
      fontSize: FontsSize.xxMedium,
      fontFamily: FontsName.appFont.semiBold,
      color: ColorData.appColor.titleAppBarColor);

  static final TextStyle hint = TextStyle(
      fontSize: FontsSize.xRegular,
      fontFamily: FontsName.appFont.medium,
      color: ColorData.appColor.hintColor);

  static final TextStyle header1 = TextStyle(
      fontSize: FontsSize.medium,
      fontFamily: FontsName.appFont.bold,
      color: ColorData.appColor.primaryTextColor);

  static final TextStyle header2 = TextStyle(
      fontSize: FontsSize.xxxRegular,
      fontFamily: FontsName.appFont.semiBold,
      color: ColorData.appColor.primaryTextColor);

  static final TextStyle label1 = TextStyle(
      fontSize: FontsSize.xRegular,
      fontFamily: FontsName.appFont.extraBold,
      color: ColorData.appColor.primaryTextColor);

  static final TextStyle text1 = TextStyle(
      fontSize: FontsSize.xRegular,
      fontFamily: FontsName.appFont.semiBold,
      color: ColorData.appColor.primaryTextColor);

  static final TextStyle text2 = TextStyle(
      fontSize: FontsSize.xRegular,
      fontFamily: FontsName.appFont.medium,
      color: ColorData.appColor.primaryTextColor);

  static final TextStyle text3 = TextStyle(
      fontSize: FontsSize.xRegular,
      fontFamily: FontsName.appFont.regular,
      color: ColorData.appColor.primaryTextColor);

  static final TextStyle description1 = TextStyle(
      fontSize: FontsSize.xRegular,
      fontFamily: FontsName.appFont.regularItalic,
      color: ColorData.appColor.primaryTextColor);
}

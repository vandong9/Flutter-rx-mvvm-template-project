import 'package:flutter/material.dart';

abstract class BaseColor {
  Color get primaryColor => const Color(0xFF137ADA);
  Color get screenBgColor => const Color(0xFFFFFFFF);

  // appbar
  Color get appBarColor => const Color(0xFFF7F7F7);
  Color get normalIconAppbarColor => const Color(0xFF919191);
  Color get activeIconAppbarColor => const Color(0xFF137ADA);
  Color get titleAppBarColor => const Color(0xFF597183);

  // text
  Color get defaultTextColor => const Color(0xFF919191);
  Color get defaultActiveTextColor => const Color(0xFFF7F7F7);

  Color get statusNewColor => const Color(0xFF3067FF);
  Color get statusPreparingColor => const Color(0xFFEBAB51);
  Color get statusReadyColor => const Color(0xFF29CB29);
  Color get statusShippingColor => const Color(0xFF5332B1);
  Color get statusCompleteColor => const Color(0xFF30B996);
  Color get statusCancelledColor => const Color(0xFFFF2929);
  Color get paymentStatusPaidColor => const Color(0xFF30B996);
  Color get paymentStatusRefundedColor => const Color(0xFFFF2929);
  Color get paymentStatusUnpaidColor => const Color(0xFFEBC251);
  Color get primaryTextColor => const Color(0xFF454545);
  Color get hintColor => const Color(0xFFAFAFAF);
  Color get clearAllColor => const Color(0xFFFF2929);
  Color get buttonHomeTextColor => const Color(0xFF000000);
  Color get numberOrdersColor => const Color(0xFFFF2929);
  // Color get lightGray => const Color(0xFFF0F0F0);
  // Color get white => const Color(0xFFFFFFFF);

  // Background
  Color get defaultButtonBackgroundColor => const Color(0xFF0D9F67);
  Color get mainBackgroundColor => const Color(0xFFE6E6E6);

  // button
  Color get iconButtonColor => const Color(0xFF0D9F67);
  Color get negativeButtonColor => const Color(0xFFE6E6E6);
  Color get positiveButtonColor => const Color(0xFF137ADA);
  Color get negativeButtonAlertColor => const Color(0xFF137ADA);
  Color get positiveButtonAlertColor => const Color(0xFF137ADA);

  // Pin
  Color get emptyPinColor => const Color(0x40FFFFFF);
  Color get filledPinColor => const Color(0xFFFFFFFF);

  Color get lineKeyboard => const Color(0xFFEBEBEB);
  Color get progressColor => const Color(0xFF454545);

  Color get borderAvatarColor => const Color(0xFFE8E8E8);

  // Border Color
  Color get defaultColor => const Color(0xFFC7C7C7);
  Color get activeColor => const Color(0xFF0D9F67);
  Color get borderColor => const Color(0xFFC2C2C2);

  // Line
  Color get line => const Color(0xFFC7C7C7);
}

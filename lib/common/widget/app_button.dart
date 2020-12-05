import 'package:ProjectTemplate/common/widget/app_text.dart';
import 'package:ProjectTemplate/res/color/color_data.dart';
import 'package:ProjectTemplate/res/dimen.dart';
import 'package:ProjectTemplate/res/fonts_size.dart';
import 'package:ProjectTemplate/res/text_style.dart';
import 'package:flutter/material.dart';

class AppButtonWidget extends StatelessWidget {
  /// Properties
  final content;
  Color _bgColor = ColorData.appColor.defaultButtonBackgroundColor;
  Color _textColor = ColorData.appColor.defaultActiveTextColor;
  final Function onClickCallback;

  AppButtonWidget(
      {@required this.content,
      @required this.onClickCallback,
      Color textColor,
      Color bgColor}) {
    if (bgColor != null) {
      _bgColor = bgColor;
      _textColor = textColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClickCallback();
      },
      child: Container(
        height: Dimen.buttonHeight,
        decoration: BoxDecoration(color: _bgColor),
        child: Center(
          child: AppText(
            text: content,
            textStyle: TextStyles.header2
                .copyWith(fontSize: FontsSize.xxRegular, color: _textColor),
          ),
        ),
      ),
    );
  }
}

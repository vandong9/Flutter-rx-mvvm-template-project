import 'package:ProjectTemplate/common/widget/app_text.dart';
import 'package:ProjectTemplate/common/widget/horizon_line.dart';
import 'package:ProjectTemplate/r.dart';
import 'package:ProjectTemplate/res/color/color_data.dart';
import 'package:ProjectTemplate/res/text_style.dart';
import 'package:flutter/material.dart';

enum LeftButtonType { back, menu, hidden, custom }

class AppNavBar extends StatelessWidget {
  final LeftButtonType leftButtonType;
  final Function onTouchBackButton;
  final Widget rightWidget;

  final String titleText;
  final Widget titleWidget;

  const AppNavBar(
      {Key key,
      this.leftButtonType = LeftButtonType.back,
      this.titleText,
      this.titleWidget,
      this.onTouchBackButton,
      this.rightWidget})
      : super(key: key);

  Widget _buildLeftButton() {
    switch (leftButtonType) {
      case LeftButtonType.back:
        return _DefaultBackButton(onTouchCallback: onTouchBackButton);
      case LeftButtonType.hidden:
        return Container();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      color: ColorData.appColor.mainBackgroundColor,
      height: 50,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                _buildLeftButton(),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: titleWidget != null
                      ? titleWidget
                      : AppText(
                          text: titleText ?? "",
                          textStyle: TextStyles.header2,
                          textAlign: TextAlign.left,
                        ),
                ),
                rightWidget ?? Container()
              ],
            ),
          ),
          HorizontalLine()
        ],
      ),
    );
  }
}

class _DefaultBackButton extends StatelessWidget {
  final Function onTouchCallback;

  const _DefaultBackButton({Key key, this.onTouchCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTouchCallback,
        child: Image.asset(
          R.generalImages.icArrowLeft,
          width: 30,
          height: 30,
          fit: BoxFit.scaleDown,
          color: ColorData.appColor.iconButtonColor,
        ));
  }
}

import 'package:ProjectTemplate/common/widget/app_text.dart';
import 'package:ProjectTemplate/res/color/color_data.dart';
import 'package:ProjectTemplate/res/fonts_size.dart';
import 'package:ProjectTemplate/res/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ProjectTemplate/extensions/string_extension.dart';
import 'dart:io';

enum AlertEvent { POSITIVE, NEGATIVE }
typedef AlertAction<T> = void Function(T index);

class AppAlertDialog {
  final String title;
  final Widget titleWidget;
  final String detailMessage;
  final Widget detailMessageWidget;
  final String positiveStr;
  final Widget positiveWidget;
  final String negativeStr;
  final Widget negativeWidget;
  final bool cancelable;
  final AlertAction<AlertEvent> actionCallback;

  AppAlertDialog(
      {this.title,
      this.titleWidget,
      this.detailMessage,
      this.detailMessageWidget,
      this.positiveStr,
      this.positiveWidget,
      this.negativeStr,
      this.negativeWidget,
      this.cancelable,
      this.actionCallback});

  Widget _getAlertDialog(
      List<Widget> actions, Widget title, Widget detailMessage) {
    if (Platform.isIOS) {
      return CupertinoAlertDialog(
        title: title,
        content: detailMessage,
        actions: actions,
      );
    } else {
      return AlertDialog(
        title: title,
        content: detailMessage,
        actions: actions,
      );
    }
  }

  Future<void> asyncShowErrorDialog(BuildContext context, String error) async {
    if (error == null || error.isEmpty) return;
    return showDialog<void>(
      context: context,
      barrierDismissible: cancelable ?? true,
      builder: (BuildContext context) {
        return _getAlertDialog(
            _getActions(context),
            _buildTitleWidget(title: "Error".localized()),
            _buildDetailMessageWidget(message: error));
      },
    );
  }

  Future<void> asyncShowDialog(BuildContext context) async {
    if ((detailMessage == null || detailMessage.isEmpty) &&
        detailMessageWidget == null) return;
    return showDialog<void>(
      context: context,
      barrierDismissible: cancelable ?? true,
      builder: (BuildContext context) {
        return _getAlertDialog(
            _getActions(context),
            _buildTitleWidget(title: title, widget: titleWidget),
            _buildDetailMessageWidget(
                message: detailMessage, widget: detailMessageWidget));
      },
    );
  }

  Widget _buildTitleWidget({String title, Widget widget}) {
    if ((title == null || title.isEmpty) && widget == null) return null;
    return widget ??
        AppText(
          text: title,
          textStyle: TextStyles.header1,
        );
  }

  Widget _buildDetailMessageWidget({String message, Widget widget}) =>
      widget ??
      AppText(
        text: message ?? '',
        textStyle: TextStyles.text2.copyWith(fontSize: FontsSize.regular),
      );

  Widget _buildButtonPositive() =>
      positiveWidget ??
      AppText(
        text: positiveStr ?? "Ok".localized().toUpperCase(),
        textStyle: TextStyles.text1
            .copyWith(color: ColorData.appColor.positiveButtonAlertColor),
      );
  Widget _buildButtonNegative() =>
      negativeWidget ??
      AppText(
        text: negativeStr ?? "Close".localized().toUpperCase(),
        textStyle: TextStyles.text1
            .copyWith(color: ColorData.appColor.negativeButtonAlertColor),
      );

  List<Widget> _getActions(BuildContext context) {
    List<Widget> actions = <Widget>[];

    if (positiveStr != null || positiveWidget != null) {
      Widget positiveButon = FlatButton(
        child: _buildButtonPositive(),
        onPressed: () {
          Navigator.pop(context);
          if (actionCallback != null) {
            actionCallback.call(AlertEvent.POSITIVE);
          }
        },
      );
      actions.add(positiveButon);
    }

    Widget negativeButton = FlatButton(
      child: _buildButtonNegative(),
      onPressed: () {
        Navigator.pop(context);
        if (actionCallback != null) {
          actionCallback.call(AlertEvent.NEGATIVE);
        }
      },
    );
    actions.add(negativeButton);
    return actions;
  }
}

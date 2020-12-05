import 'package:ProjectTemplate/common/widget/app_text.dart';
import 'package:ProjectTemplate/res/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ProjectTemplate/extensions/string_extension.dart';

class OfflineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 22,
      child: Center(
        child: AppText(
          text: "No internet connection".localized(),
          textStyle: TextStyles.text2.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

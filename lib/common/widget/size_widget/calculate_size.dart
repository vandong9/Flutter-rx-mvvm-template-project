import 'package:ProjectTemplate/common/widget/size_widget/size_info.dart';
import 'package:flutter/material.dart';

class CalculateSizeWidget extends StatelessWidget {
  final Widget Function(BuildContext context, SizingInfo sizingInfo) builder;

  const CalculateSizeWidget({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(builder: (context, boxConstraints) {
      var sizingInFo = SizingInfo(
          screenSize: mediaQuery.size,
          localWidgetSize:
              Size(boxConstraints.maxWidth, boxConstraints.maxHeight));

      return builder(context, sizingInFo);
    });
  }
}

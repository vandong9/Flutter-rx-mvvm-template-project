import 'package:ProjectTemplate/res/color/color_data.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({this.disableClick = true});

  final bool disableClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AbsorbPointer(
        absorbing: disableClick,
        child: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  ColorData.appColor.progressColor)),
        ),
      ),
    );
  }
}

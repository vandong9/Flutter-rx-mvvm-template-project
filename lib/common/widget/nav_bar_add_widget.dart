import 'package:ProjectTemplate/r.dart';
import 'package:flutter/material.dart';

class NavAddWidget extends StatelessWidget {
  final Function pressCallback;

  const NavAddWidget({Key key, this.pressCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: pressCallback,
        child: Image.asset(
          R.generalImages.icAdd,
          width: 40,
          height: 40,
          fit: BoxFit.scaleDown,
        ));
  }
}

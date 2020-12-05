import 'package:ProjectTemplate/r.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartButtonWidget extends StatelessWidget {
  final Function onPressCallback;

  const CartButtonWidget({Key key, this.onPressCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressCallback,
      child: Image.asset(R.generalImages.icCart,
          width: 40, height: 40, fit: BoxFit.scaleDown),
    );
  }
}

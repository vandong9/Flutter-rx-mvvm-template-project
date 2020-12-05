import 'package:flutter/material.dart';
import 'package:ProjectTemplate/extensions/widget_extension.dart';

class SearchTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField().cornerRadius(BorderRadius.all(Radius.circular(7)));
  }
}

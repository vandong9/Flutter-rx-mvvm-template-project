import 'package:flutter/material.dart';

extension WidgetModifier on Widget {
  Widget align([AlignmentGeometry alignment = Alignment.center]) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }

  Widget expand([int flex = 1]) {
    return Expanded(
      flex: flex,
      child: this,
    );
  }

  Widget background(Color color) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
      ),
      child: this,
    );
  }

  Widget cornerRadius(BorderRadiusGeometry radius) {
    return ClipRRect(
      borderRadius: radius,
      child: this,
    );
  }

  Widget padding([EdgeInsetsGeometry value = const EdgeInsets.all(0)]) {
    return Padding(
      padding: value,
      child: this,
    );
  }

  Widget margin([EdgeInsetsGeometry value = const EdgeInsets.all(0)]) {
    return Container(
      margin: value,
      child: this,
    );
  }

  Widget opacity([double value = 1]) {
    return Opacity(
      opacity: value,
      child: this,
    );
  }

  Widget fixSize({double width = 0, double height = 0}) {
    if (width == 0 && height == 0) {
      return this;
    }
    return Container(
      width: width == 0 ? null : width,
      height: height == 0 ? null : height,
      child: this,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:trs_abf/framework/base.dart';

class Line extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double lineHeight;

  const Line({Key key, this.padding, this.margin, this.lineHeight = 1.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin == null ? EdgeInsets.all(12) : margin,
      color: disableColor,
      height: lineHeight,
    );
  }
}

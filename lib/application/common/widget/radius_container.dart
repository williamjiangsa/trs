/*
 * 项目名:    cacart_flutter
 * 包名
 * 文件名:    radius_container
 * 创建时间:  2019/2/20 on 9:43 AM
 * 描述:     TODO
 *
 * @author   YHF
 */

import 'package:flutter/material.dart';

class RadiusContainer extends StatelessWidget {
 final double height;
 final Widget childWidget;
 final EdgeInsetsGeometry padding;
 final EdgeInsetsGeometry margin;

  RadiusContainer(
      {Key key, this.height, this.childWidget, this.padding, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height != null ? height : null,
      margin: margin != null ? margin :EdgeInsets.only(left: 10, right: 10, top: 4),
      padding: padding != null ? padding : EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: childWidget,
    );
  }
}

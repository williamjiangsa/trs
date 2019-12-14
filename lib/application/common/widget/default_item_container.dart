/*
 * 项目名:    trs_abf
 * 包名       application.common.widget
 * 文件名:    default_item
 * 创建时间:  2019/5/7 on 5:58 PM
 * 描述:     TODO
 *
 * @author   YHF
 */

import 'package:flutter/material.dart';
import 'package:trs_abf/framework/plugin/plugin.dart';

class DefaultItemContainer extends StatelessWidget {
  final Function onClick;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Widget child;
  final String title;
  final Widget rightWidget;
  final Color backgroundColor;
  final Color titleColor;

  const DefaultItemContainer(
      {Key key,
      this.onClick,
      this.padding,
      this.margin,
      this.child,
      this.title,
      this.rightWidget,
      this.backgroundColor,
      this.titleColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onClick != null) onClick();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          color: backgroundColor == null ? Colors.blue : backgroundColor,
        ),
        width: MediaQuery.of(context).size.width,
        margin: margin == null ? EdgeInsets.only(left: 12, right: 12) : margin,
        padding:
            padding == null ? EdgeInsets.only(top: 12, bottom: 12) : padding,
        child: child == null ? _defaultChildWidget() : child,
      ),
    );
  }

  _defaultChildWidget() {
    return Stack(
      children: <Widget>[
        Center(
          child: Text(
            title == null ? '' : title,
            style: TextStyle(color: titleColor == null ? Colors.white : titleColor),
          ),
        ),
        Positioned(
            right: 6,
            child: rightWidget == null
                ? GestureDetector(
                    child: Icon(
                    Icons.arrow_right,
                    color: Colors.white,
                  ))
                : rightWidget)
      ],
    );
  }
}

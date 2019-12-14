/*
 * 项目名:    trs.abf
 * 包名
 * 文件名:    edit_text
 * 创建时间:  2019/5/9 on 3:13 PM
 * 描述:     TODO
 *
 * @author   YHF
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trs_abf/application/common/common_widget.dart';
import 'package:trs_abf/framework/base.dart';

class MyEditText extends StatelessWidget {
  final String hintText;
  final Widget rightWidget;
  final Function textChange;
  final List<TextInputFormatter> formatterList;
  final TextEditingController controller;

  const MyEditText(
      {Key key,
      this.hintText,
      this.rightWidget,
      this.textChange,
      this.formatterList, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadiusContainer(
      childWidget: Stack(
        children: <Widget>[
          TextField(
            inputFormatters: formatterList,
            onChanged: (text) {
              if (textChange != null) textChange(text);
            },
            controller: controller,
            style: TextStyle(fontSize: 12),
            maxLines: 1,
            decoration: new InputDecoration(
                hintStyle: TextStyle(fontSize: 12, color: hintTextColor),
                hintText: hintText,
                border: InputBorder.none),
          ),
          Positioned(
            child: rightWidget == null ? Container() : rightWidget,
            right: 6,
            top: 8,
          )
        ],
      ),
    );
  }
}

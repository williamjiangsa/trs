/*
 * 项目名:    cacart_flutter
 * 包名
 * 文件名:    check_box
 * 创建时间:  2019/3/6 on 8:11 PM
 * 描述:     TODO
 *
 * @author   YHF
 */

import 'package:flutter/material.dart';
import 'package:trs_abf/framework/base.dart';

typedef CheckChangeListener = void Function(bool isSelect);

class CheckBox extends StatelessWidget {
  final bool isSelect;
  final CheckChangeListener changeListener;
  final double size;

  const CheckBox(
      {Key key, this.isSelect = false, this.changeListener, this.size = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 6, right: 6),
      child: GestureDetector(
        onTap: () {
          if (changeListener != null) {
            changeListener(isSelect);
          }
        },
        child: Icon(
          isSelect ? Icons.check : Icons.select_all,
          size: size,
          color: defaultColor,
        ),
      ),
    );
  }
}

/*
 * 项目名:    trs.abf
 * 包名
 * 文件名:    text_item
 * 创建时间:  2019/5/9 on 3:16 PM
 * 描述:     TODO
 *
 * @author   YHF
 */

import 'package:flutter/material.dart';
import 'package:trs_abf/framework/base.dart';

class MyTextItem extends StatelessWidget {
  final String leftText;
  final String rightText;

  const MyTextItem({Key key, this.leftText, this.rightText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12, bottom: 12),
      child: Row(
        children: <Widget>[
          Text(
            leftText,
            maxLines: 2,
          ),
          Text(
            rightText,
            style: TextStyle(color: desRed),
          ),
        ],
      ),
    );
  }
}

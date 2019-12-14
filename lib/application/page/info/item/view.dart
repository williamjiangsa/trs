import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:trs_abf/application/page/info/bean/info_item_bean.dart';
import 'package:trs_abf/application/page/main/bean/home_item_bean.dart';
import 'package:trs_abf/framework/plugin/plugin.dart';
import 'package:trs_abf/framework/base.dart';

Widget buildView(
    InfoItemBean state, Dispatch dispatch, ViewService viewService) {
  return ExpansionTile(
    title: Container(
      width: MediaQuery.of(viewService.context).size.width,
      padding: EdgeInsets.only(top: 18, bottom: 18, left: 12),
      child: Text(
        state.title,
        style: TextStyle(color: defaultBlackTextColor),
      ),
    ),
    initiallyExpanded: false,
    //默认是否展开
    children: <Widget>[
      Container(
        width: MediaQuery.of(viewService.context).size.width,
        margin: EdgeInsets.only(bottom: 1, left: 12, right: 12),
        padding: EdgeInsets.only(top: 12, bottom: 12),
        child: Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text(
            state.content,
            maxLines: 1000,
            style: TextStyle(color: defaultBlackTextColor),
          ),
        ),
      )
    ],
  );
}

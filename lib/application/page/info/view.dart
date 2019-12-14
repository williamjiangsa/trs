import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:trs_abf/application/common/common_widget.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(InfoState state, Dispatch dispatch, ViewService viewService) {
  var buildAdapter = viewService.buildAdapter();
  return Scaffold(
    appBar: DefaultToolBar(
      title: '信息',
    ),
    body: ListView.builder(
      itemBuilder: buildAdapter.itemBuilder,
      itemCount: buildAdapter.itemCount,
    ),
  );
}

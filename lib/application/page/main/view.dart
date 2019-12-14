import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:trs_abf/application/common/common_widget.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {
  var buildAdapter = viewService.buildAdapter();
  return Scaffold(
    appBar: DefaultToolBar(
      title: '首页',
      showBackButton: false,
    ),
    body: ListView.builder(
      itemBuilder: buildAdapter.itemBuilder,
      itemCount: buildAdapter.itemCount,
    ),
  );
}

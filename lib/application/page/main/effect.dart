import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:trs_abf/application/common/common_app_plugin.dart';
import 'package:trs_abf/application/common/common_widget.dart';
import 'package:trs_abf/application/common/db/provier/invoice_provider.dart';
import 'package:trs_abf/application/common/db/provier/pay_detail_provider.dart';
import 'package:trs_abf/application/common/db/provier/travel_provider.dart';
import 'package:trs_abf/application/common/event/main_event.dart';
import 'action.dart';
import 'state.dart';
import 'package:trs_abf/framework/plugin/plugin.dart';

StreamSubscription listen;

Effect<MainState> buildEffect() {
  return combineEffects(<Object, Effect<MainState>>{
    Lifecycle.initState: _initState,
    Lifecycle.dispose: _dispose,
    MainAction.action: _onAction,
    MainAction.deleteInvoice: _deleteInvoice,
    MainAction.deleteApply: _deleteApply,
  });
}

void _onAction(Action action, Context<MainState> ctx) {}

void _deleteInvoice(Action action, Context<MainState> ctx) {
  showDialog(
    context: ctx.context,
    builder: (BuildContext context) {
      return new MessageDialog(
        //调用对话框
        title: '提示',
        message: '是否删除所有发票',
        onCloseEvent: () {
          RouterUtil.instance.pop(ctx.context);
        },
        onPositivePressEvent: () {
          RouterUtil.instance.pop(ctx.context);
          InvoiceProvider().delete().then((data) {
            print(data);
            SharedPreferencesUtil.putBool(SpKey.IS_FINISH_INVOICE, false);
            _deleteSuccess();
          });
        },
        positiveText: '是',
        negativeText: '否',
      );
    },
  );
}

void _deleteSuccess() {
  Fluttertoast.showToast(msg: '删除成功');
  EventBusUtil.instance.eventBus.fire(RefreshMainData());
}

void _deleteApply(Action action, Context<MainState> ctx) {
  showDialog(
    context: ctx.context,
    builder: (BuildContext context) {
      return new MessageDialog(
        //调用对话框
        title: '提示',
        message: '是否删除所有申请',
        onCloseEvent: () {
          RouterUtil.instance.pop(ctx.context);
        },
        onPositivePressEvent: () {
          SharedPreferencesUtil.putBool(SpKey.IS_FINISH_INVOICE, false);
          SharedPreferencesUtil.putBool(SpKey.IS_FINISH_PAY_DETAIL, false);
          SharedPreferencesUtil.putBool(SpKey.IS_FINISH_TRAVEL, false);
          _deleteAllDbData(ctx);
          RouterUtil.instance.pop(ctx.context);
        },
        positiveText: '是',
        negativeText: '否',
      );
    },
  );
}

Future _deleteAllDbData(Context<MainState> ctx) async {
  await InvoiceProvider().delete();
  await PayDetailProvider().delete();
  await TravelProvider().delete();
  _deleteSuccess();
}

void _dispose(Action action, Context<MainState> ctx) {
  listen.cancel();
}

void _initState(Action action, Context<MainState> ctx) {
  ctx.dispatch(MainActionCreator.onInitHomeListDataAction());
  listen = EventBusUtil.instance.eventBus.on<RefreshMainData>().listen((event) {
    ctx.dispatch(MainActionCreator.onInitHomeListDataAction());
  });
}

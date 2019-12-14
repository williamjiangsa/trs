import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:trs_abf/application/common/common_app_plugin.dart';
import 'package:trs_abf/application/common/db/provier/invoice_provider.dart';
import 'package:trs_abf/application/common/db/provier/travel_child_item_provider.dart';
import 'package:trs_abf/application/common/event/main_event.dart';
import 'package:trs_abf/application/page/main/effect.dart';
import 'action.dart';
import 'state.dart';
import 'package:trs_abf/framework/plugin/plugin.dart';
import 'package:trs_abf/application/common/db/db_helper.dart';

StreamSubscription listen;

Effect<MyInvoiceState> buildEffect() {
  return combineEffects(<Object, Effect<MyInvoiceState>>{
    MyInvoiceAction.action: _onAction,
    Lifecycle.initState: _initInvoiceChild,
    Lifecycle.dispose: _dispose,
    MyInvoiceAction.refreshData: _onRefreshAction,
    MyInvoiceAction.delInvoice: _onDelInvoiceAction,
  });
}

void _onAction(Action action, Context<MyInvoiceState> ctx) {}

void _onDelInvoiceAction(Action action, Context<MyInvoiceState> ctx) {
  TravelChildItemProvider().delete(id: action.payload).then((data) {
    print(data);
    _initData(ctx);
  });
}

void _onRefreshAction(Action action, Context<MyInvoiceState> ctx) {
  _initInvoiceChild(action, ctx);
}

void _initInvoiceChild(Action action, Context<MyInvoiceState> ctx) {
  //int invoiceNum,invoiceAllMoney,invoiceAllMoneyList childItemList
  _initData(ctx);
  listen =
      EventBusUtil.instance.eventBus.on<RefreshInvoiceData>().listen((event) {
    _initData(ctx);
  });
}

void _initData(Context<MyInvoiceState> ctx) {
  getInvoiceItem().then((data) {
    if (data.length > 0) {
      ctx.dispatch(MyInvoiceActionCreator.onInitDataAction({
        'invoiceNum': data.length,
        'invoiceAllMoney':
            CommonFunction.getInvoiceAllMoney(data).toStringAsFixed(2),
        'invoiceAllReturnMoney':
            (CommonFunction.getInvoiceAllMoney(data) * CommonData.returnRatio)
                .toStringAsFixed(2),
        'itemList': CommonFunction.converterData(data)
      }));
    } else {
      ctx.dispatch(MyInvoiceActionCreator.onInitDataAction({
        'invoiceNum': 0,
        'invoiceAllMoney': 0.00,
        'invoiceAllReturnMoney': '0',
        'itemList': {}
      }));
    }
  });
}

void _dispose(Action action, Context<MyInvoiceState> ctx) {
  listen.cancel();
}

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:trs_abf/application/common/common_app_plugin.dart';
import 'package:trs_abf/application/common/db/db_helper.dart';
import 'package:trs_abf/application/common/db/provier/invoice_provider.dart';
import 'package:trs_abf/application/common/db/provier/travel_child_item_provider.dart';
import 'package:trs_abf/application/common/event/main_event.dart';
import 'package:trs_abf/application/page/invoice/action.dart';
import 'package:trs_abf/framework/plugin/plugin.dart';
import 'action.dart';
import 'state.dart';
import 'dart:convert';

Effect<AddInvoiceState> buildEffect() {
  return combineEffects(<Object, Effect<AddInvoiceState>>{
    AddInvoiceAction.action: _onAction,
    AddInvoiceAction.selectDate: _onSelectDateAction,
    AddInvoiceAction.save: _onSaveAction,
  });
}

void _onAction(Action action, Context<AddInvoiceState> ctx) {}

void _onSaveAction(Action action, Context<AddInvoiceState> ctx) async {
  if (ObjectUtil.isEmptyString(ctx.state.confirmDate)) {
    Fluttertoast.showToast(msg: '请选择发票日期');
    return;
  }
  if (ObjectUtil.isEmptyString(ctx.state.abnNumber)) {
    Fluttertoast.showToast(msg: '请输入abn');
    return;
  }

  if (ObjectUtil.isEmptyList(ctx.state.invoiceList)) {
    Fluttertoast.showToast(msg: '请添加发票项目');
    return;
  }

  insertInvoiceItem({
    InvoiceProvider.abnNumber: ctx.state.abnNumber,
  }, ctx.state.invoiceList, ctx.state.confirmDate, ctx.state.invoiceNumber,ctx.state.invoiceChildItemId)
      .then((data) {
    SharedPreferencesUtil.putBool(SpKey.IS_FINISH_INVOICE, true);
    EventBusUtil.instance.eventBus.fire(RefreshMainData());
    EventBusUtil.instance.eventBus.fire(RefreshInvoiceData());
    RouterUtil.instance.pop(ctx.context);
  });
  //插入父级
}


void _onSelectDateAction(Action action, Context<AddInvoiceState> ctx) {
  DatePicker.showDatePicker(ctx.context, showTitleActions: true,
      onChanged: (date) {
    print('change $date');
  }, onConfirm: (date) {
    ctx.dispatch(AddInvoiceActionCreator.onConfirmSelectDateAction(
        '${date.day}/${date.month}/${date.year}'));
  });
}

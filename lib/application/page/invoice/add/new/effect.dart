import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:trs_abf/application/common/common_app_plugin.dart';
import 'action.dart';
import 'package:trs_abf/framework/plugin/plugin.dart';
import 'state.dart';

Effect<AddNewInvoiceState> buildEffect() {
  return combineEffects(<Object, Effect<AddNewInvoiceState>>{
    AddNewInvoiceAction.action: _onAction,
    AddNewInvoiceAction.selectGoodsType: _onSelectGoodsTypeAction,
    AddNewInvoiceAction.confirm: _onConfirmAction
  });
}

void _onAction(Action action, Context<AddNewInvoiceState> ctx) {}

void _onConfirmAction(Action action, Context<AddNewInvoiceState> ctx) {
  if (ObjectUtil.isEmptyString(ctx.state.goodsType)) {
    Fluttertoast.showToast(msg: '请选择商品类型');
    return;
  }
  if (ObjectUtil.isEmptyString(ctx.state.money)) {
    Fluttertoast.showToast(msg: '请输入退税金额');
    return;
  }
  RouterUtil.instance.popWithData(ctx.context,
      {'money': ctx.state.money, 'goodsType': ctx.state.goodsType});
}

void _onSelectGoodsTypeAction(Action action, Context<AddNewInvoiceState> ctx) {
  Picker picker = new Picker(
      adapter: PickerDataAdapter<String>(pickerdata: CommonData.invoiceItemList),
      changeToFirst: true,
      textAlign: TextAlign.center,
      columnPadding: const EdgeInsets.all(8.0),
      onConfirm: (Picker picker, List value) {
        ctx.dispatch(AddNewInvoiceActionCreator.onConfirmSelectGoodsTypeAction(
            picker.getSelectedValues()[0]));
      });
  picker.show(ctx.state.key.currentState);
}

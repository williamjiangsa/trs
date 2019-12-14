import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AddNewInvoiceState> buildReducer() {
  return asReducer(
    <Object, Reducer<AddNewInvoiceState>>{
      AddNewInvoiceAction.action: _onAction,
      AddNewInvoiceAction.confirmSelectGoodsType:
          _onConfirmSelectGoodsTypeAction,
      AddNewInvoiceAction.moneyChange: _onMoneyChangeAction,
    },
  );
}

AddNewInvoiceState _onAction(AddNewInvoiceState state, Action action) {
  final AddNewInvoiceState newState = state.clone();
  return newState;
}

AddNewInvoiceState _onMoneyChangeAction(
    AddNewInvoiceState state, Action action) {
  final AddNewInvoiceState newState = state.clone();
  newState.money = action.payload;
  return newState;
}

AddNewInvoiceState _onConfirmSelectGoodsTypeAction(
    AddNewInvoiceState state, Action action) {
  final AddNewInvoiceState newState = state.clone();
  newState.goodsType = action.payload;
  return newState;
}

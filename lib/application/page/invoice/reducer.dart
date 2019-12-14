import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MyInvoiceState> buildReducer() {
  return asReducer(
    <Object, Reducer<MyInvoiceState>>{
      MyInvoiceAction.action: _onAction,
      MyInvoiceAction.initData:_onInitDataAction
    },
  );
}

MyInvoiceState _onAction(MyInvoiceState state, Action action) {
  final MyInvoiceState newState = state.clone();
  return newState;
}

MyInvoiceState _onInitDataAction(MyInvoiceState state, Action action) {
  final MyInvoiceState newState = state.clone();
  newState.invoiceNum=action.payload['invoiceNum'].toString();
  newState.itemListMap=action.payload['itemList'];
  newState.invoiceAllMoney=action.payload['invoiceAllMoney'].toString();
  newState.invoiceAllReturnMoney=action.payload['invoiceAllReturnMoney'].toString();
  return newState;
}

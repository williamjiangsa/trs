import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MyApplyState> buildReducer() {
  return asReducer(
    <Object, Reducer<MyApplyState>>{
      MyApplyAction.action: _onAction,
      MyApplyAction.initData: _initData
    },
  );
}

MyApplyState _onAction(MyApplyState state, Action action) {
  final MyApplyState newState = state.clone();
  return newState;
}

MyApplyState _initData(MyApplyState state, Action action) {
  final MyApplyState newState = state.clone();
  newState.itemListMap = action.payload['invoiceList'];
  newState.payDetail = action.payload['payDetail'];
  newState.travelDetail = action.payload['travelDetail'];
  newState.invoiceAllReturnMoney=action.payload['invoiceAllReturnMoney'].toString();
  newState.invoiceAllMoney=action.payload['invoiceAllMoney'].toString();
  return newState;
}

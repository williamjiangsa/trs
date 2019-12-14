import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AddInvoiceState> buildReducer() {
  return asReducer(
    <Object, Reducer<AddInvoiceState>>{
      AddInvoiceAction.action: _onAction,
      AddInvoiceAction.confirmSelectDate: _onConfirmSelectDateAction,
      AddInvoiceAction.addInvoiceChild: _onAddInvoiceChildAction,
      AddInvoiceAction.deleteInvoiceChild: _onDeleteInvoiceChildAction,
      AddInvoiceAction.save: _onSaveAction,
      AddInvoiceAction.abnNumberChange: _onAbnNumberChangeAction,
      AddInvoiceAction.invoiceNumberChange:_invoiceNumberChange
    },
  );
}

AddInvoiceState _onAction(AddInvoiceState state, Action action) {
  final AddInvoiceState newState = state.clone();
  return newState;
}

AddInvoiceState _invoiceNumberChange(AddInvoiceState state, Action action) {
  final AddInvoiceState newState = state.clone();
  newState.invoiceNumber=action.payload;
  return newState;
}

AddInvoiceState _onAbnNumberChangeAction(AddInvoiceState state, Action action) {
  final AddInvoiceState newState = state.clone();
  newState.abnNumber = action.payload;
  return newState;
}

AddInvoiceState _onSaveAction(AddInvoiceState state, Action action) {
  final AddInvoiceState newState = state.clone();
  return newState;
}

AddInvoiceState _onAddInvoiceChildAction(AddInvoiceState state, Action action) {
  final AddInvoiceState newState = state.clone();
  newState.invoiceList.add(action.payload);
  return newState;
}

AddInvoiceState _onDeleteInvoiceChildAction(
    AddInvoiceState state, Action action) {
  final AddInvoiceState newState = state.clone();
  newState.invoiceList.removeAt(newState.invoiceList.indexOf(action.payload));
  return newState;
}

AddInvoiceState _onConfirmSelectDateAction(
    AddInvoiceState state, Action action) {
  final AddInvoiceState newState = state.clone();
  newState.confirmDate = action.payload;
  return newState;
}

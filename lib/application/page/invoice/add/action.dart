import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AddInvoiceAction {
  action,
  selectDate,
  confirmSelectDate,
  addInvoiceChild,
  save,
  deleteInvoiceChild,
  abnNumberChange,
  invoiceNumberChange
}

class AddInvoiceActionCreator {
  static Action onAction() {
    return const Action(AddInvoiceAction.action);
  }

  static Action onSelectDateAction() {
    return const Action(AddInvoiceAction.selectDate);
  }

  static Action onConfirmSelectDateAction(String date) {
    return Action(AddInvoiceAction.confirmSelectDate, payload: date);
  }

  static Action onInvoiceNumberChangeAction(String data) {
    return Action(AddInvoiceAction.invoiceNumberChange, payload: data);
  }

  static Action onAddInvoiceChildAction(date) {
    return Action(AddInvoiceAction.addInvoiceChild, payload: date);
  }

  static Action onDeleteInvoiceChildAction(date) {
    return Action(AddInvoiceAction.deleteInvoiceChild, payload: date);
  }

  static Action onAbnNumberChangeAction(date) {
    return Action(AddInvoiceAction.abnNumberChange, payload: date);
  }

  static Action onSaveAction() {
    return Action(AddInvoiceAction.save);
  }
}

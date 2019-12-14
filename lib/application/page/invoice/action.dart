import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MyInvoiceAction { action, initData, refreshData, delInvoice }

class MyInvoiceActionCreator {
  static Action onAction() {
    return const Action(MyInvoiceAction.action);
  }

  static Action onInitDataAction(data) {
    return Action(MyInvoiceAction.initData, payload: data);
  }

  static Action onRefreshDataAction() {
    return Action(MyInvoiceAction.refreshData);
  }

  static Action onDelInvoiceAction(int parentIndex, int childIndex) {
    return Action(MyInvoiceAction.delInvoice,
        payload: {'parentIndex': parentIndex, 'childIndex': childIndex});
  }

  static Action onDelInvoiceItemAction(int invoiceChildItemId) {
    return Action(MyInvoiceAction.delInvoice,
        payload: invoiceChildItemId);
  }
}

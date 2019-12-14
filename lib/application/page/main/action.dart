import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MainAction { action,initHomeListData, deleteInvoice,deleteApply}

class MainActionCreator {
  static Action onAction() {
    return const Action(MainAction.action);
  }

  static Action onInitHomeListDataAction() {
    return const Action(MainAction.initHomeListData);
  }

  static Action onDeleteInvoiceDataAction() {
    return const Action(MainAction.deleteInvoice);
  }

  static Action onDeleteApplyDataAction() {
    return const Action(MainAction.deleteApply);
  }
}

import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AddNewInvoiceAction { action, selectGoodsType, confirmSelectGoodsType,moneyChange,confirm, }

class AddNewInvoiceActionCreator {
  static Action onAction() {
    return const Action(AddNewInvoiceAction.action);
  }

  static Action onSelectGoodsTypeAction() {
    return const Action(AddNewInvoiceAction.selectGoodsType);
  }

  static Action onConfirmSelectGoodsTypeAction(String confirmType) {
    return Action(AddNewInvoiceAction.confirmSelectGoodsType,
        payload: confirmType);
  }

  static Action onMoneyChangeAction(String money) {
    return Action(AddNewInvoiceAction.moneyChange,
        payload: money);
  }

  static Action onConfirmAction() {
    return Action(AddNewInvoiceAction.confirm);
  }
}

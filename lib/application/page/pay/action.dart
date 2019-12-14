import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PayDetailAction {
  action,
  initData,
  selectCurrency,
  confirmSelectCurrency,
  changeLastName,
  changeName,
  selectCountry,
  confirmSelectCountry,
  changeAddressLineOne,
  changeAddressLineTwo,
  changeCity,
  changePro,
  changeZipCode,
  changeCheckZp,
  changeCheckAsAccount,
  changeCheckXyk,
  changeAccountName,
  changeAccount,
  changeBsbNumber,
  save
}

class PayDetailActionCreator {
  static Action onAction() {
    return const Action(PayDetailAction.action);
  }

  static Action onInitDataAction(data) {
    return Action(PayDetailAction.initData, payload: data);
  }

  static Action onSaveAction() {
    return const Action(PayDetailAction.save);
  }

  static Action onChangeCheckZpAction() {
    return const Action(PayDetailAction.changeCheckZp);
  }

  static Action onChangeAccountNameAction(String accountName) {
    return Action(PayDetailAction.changeAccountName, payload: accountName);
  }

  static Action onChangeAccountAction(String account) {
    return Action(PayDetailAction.changeAccount, payload: account);
  }

  static Action onChangeBsbNumberAction(String bsbNumber) {
    return Action(PayDetailAction.changeBsbNumber, payload: bsbNumber);
  }

  static Action onChangeCheckAsAccountAction() {
    return const Action(PayDetailAction.changeCheckAsAccount);
  }

  static Action onChangeCheckXykAction() {
    return const Action(PayDetailAction.changeCheckXyk);
  }

  static Action onSelectCurrencyAction() {
    return const Action(PayDetailAction.selectCurrency);
  }

  static Action onChangeLastNameAction(String lastName) {
    return Action(PayDetailAction.changeLastName, payload: lastName);
  }

  static Action onChangeNameAction(String name) {
    return Action(PayDetailAction.changeName, payload: name);
  }

  static Action onSelectCountryAction() {
    return const Action(PayDetailAction.selectCountry);
  }

  static Action onConfirmSelectCountryAction(String confirmCountry) {
    return Action(PayDetailAction.confirmSelectCountry,
        payload: confirmCountry);
  }

  static Action onConfirmSelectCurrencyAction(String confirmSelectCurrency) {
    return Action(PayDetailAction.confirmSelectCurrency,
        payload: confirmSelectCurrency);
  }

  static Action onChangeAddressLineOneAction(String changeAddressLineOne) {
    return Action(PayDetailAction.changeAddressLineOne,
        payload: changeAddressLineOne);
  }

  static Action onChangeAddressLineTwoAction(String changeAddressLineTwo) {
    return Action(PayDetailAction.changeAddressLineTwo,
        payload: changeAddressLineTwo);
  }

  static Action onChangeCityAction(String cityName) {
    return Action(PayDetailAction.changeCity, payload: cityName);
  }

  static Action onChangeProAction(String proName) {
    return Action(PayDetailAction.changePro, payload: proName);
  }

  static Action onChangeZipCodeAction(String zipCode) {
    return Action(PayDetailAction.changeZipCode, payload: zipCode);
  }
}

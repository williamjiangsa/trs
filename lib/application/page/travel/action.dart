import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum TravelDetailsAction {
  action,
  initData,
  selectDate,
  confirmSelectDate,
  selectCountry,
  confirmSelectCountry,
  changeNumber,
  save,
  changeIsAsSelect,
}

class TravelDetailsActionCreator {
  static Action onAction() {
    return const Action(TravelDetailsAction.action);
  }

  static Action onChangeIsAsSelectAction() {
    return const Action(TravelDetailsAction.changeIsAsSelect);
  }


  static Action onSaveAction() {
    return const Action(TravelDetailsAction.save);
  }

  static Action onInitDataAction(data) {
    return  Action(TravelDetailsAction.initData,payload: data);
  }

  static Action onSelectDateAction() {
    return const Action(TravelDetailsAction.selectDate);
  }

  static Action onConfirmSelectDateAction(String date) {
    return Action(TravelDetailsAction.confirmSelectDate, payload: date);
  }

  static Action onSelectCountryAction() {
    return Action(TravelDetailsAction.selectCountry);
  }

  static Action onConfirmSelectCountryAction(String date) {
    return Action(TravelDetailsAction.confirmSelectCountry, payload: date);
  }

  static Action onChangeNumberAction(String date) {
    return Action(TravelDetailsAction.changeNumber, payload: date);
  }
}

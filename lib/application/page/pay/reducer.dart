import 'package:fish_redux/fish_redux.dart';
import 'package:trs_abf/application/common/common_app_plugin.dart';
import 'package:trs_abf/application/common/db/provier/pay_detail_provider.dart';

import 'action.dart';
import 'state.dart';

Reducer<PayDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<PayDetailState>>{
      PayDetailAction.action: _onAction,
      PayDetailAction.confirmSelectCountry: _confirmSelectCountry,
      PayDetailAction.changeCheckAsAccount: _changeCheckAsAccount,
      PayDetailAction.changeCheckZp: _changeCheckZp,
      PayDetailAction.changeCheckXyk: _changeCheckXyk,
      PayDetailAction.confirmSelectCurrency: _confirmSelectCurrency,
      PayDetailAction.changeLastName: _changeLastName,
      PayDetailAction.changeName: _changeName,
      PayDetailAction.changeAddressLineOne: _changeAddressLineOne,
      PayDetailAction.changeAddressLineTwo: _changeAddressLineTwo,
      PayDetailAction.changePro: _changePro,
      PayDetailAction.changeZipCode: _changeZipCode,
      PayDetailAction.changeCity: _changeCity,
      PayDetailAction.initData: _initData,
      PayDetailAction.changeBsbNumber: _changeBsbNumber,
      PayDetailAction.changeAccount: _changeAccount,
      PayDetailAction.changeAccountName: _changeAccountName,
    },
  );
}

PayDetailState _onAction(PayDetailState state, Action action) {
  final PayDetailState newState = state.clone();
  return newState;
}

PayDetailState _changeBsbNumber(PayDetailState state, Action action) {
  final PayDetailState newState = state.clone();
  newState.bsbNumber = action.payload;
  return newState;
}

PayDetailState _changeAccount(PayDetailState state, Action action) {
  final PayDetailState newState = state.clone();
  newState.account = action.payload;
  return newState;
}

PayDetailState _changeAccountName(PayDetailState state, Action action) {
  final PayDetailState newState = state.clone();
  newState.accountName = action.payload;
  return newState;
}

PayDetailState _initData(PayDetailState state, Action action) {
  final PayDetailState newState = state.clone();
  var payload = action.payload;
  if (payload[PayDetailProvider.channel] == CommonData.channelXyk) {
    newState.checkXyk = true;
  } else if (payload[PayDetailProvider.channel]== CommonData.channelAsAccount) {
    newState.checkAsAccount = true;
  } else {
    newState.checkAsZp = true;
  }
  newState.city = payload[PayDetailProvider.city];
  newState.country = payload[PayDetailProvider.country];
  newState.addressLineOne = payload[PayDetailProvider.addressLineOne];
  newState.addressLineTwo = payload[PayDetailProvider.addressLineTwo];
  newState.pro = payload[PayDetailProvider.pro];
  newState.zipCode = payload[PayDetailProvider.zipCode];
  newState.name = payload[PayDetailProvider.name];
  newState.lastName = payload[PayDetailProvider.lastName];
  newState.currency = payload[PayDetailProvider.currency];
  newState.accountName = payload[PayDetailProvider.accountName];
  newState.account = payload[PayDetailProvider.account];
  newState.bsbNumber = payload[PayDetailProvider.bsbNumber];

  return newState;
}

PayDetailState _confirmSelectCountry(PayDetailState state, Action action) {
  final PayDetailState newState = state.clone();
  newState.country = action.payload;
  return newState;
}

PayDetailState _changeCity(PayDetailState state, Action action) {
  final PayDetailState newState = state.clone();
  newState.city = action.payload;
  return newState;
}

PayDetailState _changeLastName(PayDetailState state, Action action) {
  final PayDetailState newState = state.clone();
  newState.lastName = action.payload;
  return newState;
}

PayDetailState _changeName(PayDetailState state, Action action) {
  final PayDetailState newState = state.clone();
  newState.name = action.payload;
  return newState;
}

PayDetailState _changeAddressLineOne(PayDetailState state, Action action) {
  final PayDetailState newState = state.clone();
  newState.addressLineOne = action.payload;
  return newState;
}

PayDetailState _changeAddressLineTwo(PayDetailState state, Action action) {
  final PayDetailState newState = state.clone();
  newState.addressLineTwo = action.payload;
  return newState;
}

PayDetailState _changePro(PayDetailState state, Action action) {
  final PayDetailState newState = state.clone();
  newState.pro = action.payload;
  return newState;
}

PayDetailState _changeZipCode(PayDetailState state, Action action) {
  final PayDetailState newState = state.clone();
  newState.zipCode = action.payload;
  return newState;
}

PayDetailState _confirmSelectCurrency(PayDetailState state, Action action) {
  final PayDetailState newState = state.clone();
  newState.currency = action.payload;
  return newState;
}

PayDetailState _changeCheckZp(PayDetailState state, Action action) {
  final PayDetailState newState = state.clone();
  if (newState.checkAsZp == true) {
    newState.checkAsZp = false;
  } else {
    resetCheckState(newState);
    newState.checkAsZp = true;
  }
  return newState;
}

PayDetailState _changeCheckXyk(PayDetailState state, Action action) {
  final PayDetailState newState = state.clone();
  if (newState.checkXyk == true) {
    newState.checkXyk = false;
  } else {
    resetCheckState(newState);
    newState.checkXyk = true;
  }
  return newState;
}

PayDetailState _changeCheckAsAccount(PayDetailState state, Action action) {
  final PayDetailState newState = state.clone();
  if (newState.checkAsAccount == true) {
    newState.checkAsAccount = false;
  } else {
    resetCheckState(newState);
    newState.checkAsAccount = true;
  }
  return newState;
}

void resetCheckState(PayDetailState newState) {
  newState.checkAsAccount = false;
  newState.checkAsZp = false;
  newState.checkXyk = false;
}

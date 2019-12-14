import 'package:fish_redux/fish_redux.dart';
import 'package:trs_abf/application/common/db/provier/travel_provider.dart';

import 'action.dart';
import 'state.dart';

Reducer<TravelDetailsState> buildReducer() {
  return asReducer(
    <Object, Reducer<TravelDetailsState>>{
      TravelDetailsAction.action: _onAction,
      TravelDetailsAction.confirmSelectDate: _onConfirmSelectDateAction,
      TravelDetailsAction.confirmSelectCountry: _onConfirmSelectCountryAction,
      TravelDetailsAction.changeNumber: _onChangeNumberAction,
      TravelDetailsAction.initData: _initData,
      TravelDetailsAction.changeIsAsSelect: _changeIsAsSelect
    },
  );
}

TravelDetailsState _onAction(TravelDetailsState state, Action action) {
  final TravelDetailsState newState = state.clone();
  return newState;
}

TravelDetailsState _changeIsAsSelect(TravelDetailsState state, Action action) {
  final TravelDetailsState newState = state.clone();
  newState.isAsPerson = !newState.isAsPerson;
  return newState;
}

TravelDetailsState _initData(TravelDetailsState state, Action action) {
  final TravelDetailsState newState = state.clone();
  newState.number = action.payload[TravelProvider.number];
  newState.confirmCountry = action.payload[TravelProvider.selectCountry];
  newState.confirmDate = action.payload[TravelProvider.selectLeaveData];
  return newState;
}

TravelDetailsState _onChangeNumberAction(
    TravelDetailsState state, Action action) {
  final TravelDetailsState newState = state.clone();
  newState.number = action.payload;
  return newState;
}

TravelDetailsState _onConfirmSelectDateAction(
    TravelDetailsState state, Action action) {
  final TravelDetailsState newState = state.clone();
  newState.confirmDate = action.payload;
  return newState;
}

TravelDetailsState _onConfirmSelectCountryAction(
    TravelDetailsState state, Action action) {
  final TravelDetailsState newState = state.clone();
  newState.confirmCountry = action.payload;
  return newState;
}

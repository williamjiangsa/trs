import 'dart:convert';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:trs_abf/application/common/common_app_plugin.dart';
import 'package:trs_abf/application/common/db/provier/travel_provider.dart';
import 'package:trs_abf/application/common/event/main_event.dart';
import 'package:trs_abf/application/page/main/action.dart';
import 'package:trs_abf/framework/plugin/plugin.dart';
import 'action.dart';
import 'state.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_picker/flutter_picker.dart';

Effect<TravelDetailsState> buildEffect() {
  return combineEffects(<Object, Effect<TravelDetailsState>>{
    TravelDetailsAction.action: _onAction,
    Lifecycle.initState: _initState,
    TravelDetailsAction.selectDate: _onSelectDateAction,
    TravelDetailsAction.selectCountry: _onSelectCountryAction,
    TravelDetailsAction.save: _onSaveAction
  });
}

void _onAction(Action action, Context<TravelDetailsState> ctx) {}

void _initState(Action action, Context<TravelDetailsState> ctx) {
  TravelProvider().query().then((data) {
    if (!ObjectUtil.isEmptyList(data)) {
      ctx.dispatch(TravelDetailsActionCreator.onInitDataAction(data[0]));
    }
  });
}

void _onSaveAction(Action action, Context<TravelDetailsState> ctx) {
  if (ObjectUtil.isEmptyString(ctx.state.confirmDate)) {
    Fluttertoast.showToast(msg: '请选择离开日期');
    return;
  }

  if (ObjectUtil.isEmptyString(ctx.state.confirmCountry)) {
    Fluttertoast.showToast(msg: '请选择城市');
    return;
  }

  if (ObjectUtil.isEmptyString(ctx.state.number)) {
    Fluttertoast.showToast(msg: '请填写护照号码');
    return;
  }
  TravelProvider().insert({
    TravelProvider.number: ctx.state.number,
    TravelProvider.selectCountry: ctx.state.confirmCountry,
    TravelProvider.isLocalPerson: ctx.state.isAsPerson?'1':'2',
    TravelProvider.selectLeaveData: ctx.state.confirmDate
  }).then((data) {
    Fluttertoast.showToast(msg: '保存成功');
    SharedPreferencesUtil.putBool(SpKey.IS_FINISH_TRAVEL, true);
    EventBusUtil.instance.eventBus.fire(RefreshMainData());
    RouterUtil.instance.pop(ctx.context);
  });
}

void _onSelectDateAction(Action action, Context<TravelDetailsState> ctx) {
  DatePicker.showDatePicker(ctx.context, showTitleActions: true,
      onChanged: (date) {
    print('change $date');
  }, onConfirm: (date) {
    ctx.dispatch(
        TravelDetailsActionCreator.onConfirmSelectDateAction('${date.day}/${date.month}/${date.year}'));
  });
}

void _onSelectCountryAction(Action action, Context<TravelDetailsState> ctx) {
  Picker picker = new Picker(
      adapter: PickerDataAdapter<String>(pickerdata: CommonData.countryList),
      changeToFirst: true,
      textAlign: TextAlign.center,
      columnPadding: const EdgeInsets.all(8.0),
      onConfirm: (Picker picker, List value) {
        ctx.dispatch(TravelDetailsActionCreator.onConfirmSelectCountryAction(
            picker.getSelectedValues()[0]));
      });
  picker.show(ctx.state.key.currentState);
}

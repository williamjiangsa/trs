import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:trs_abf/application/common/common_app_plugin.dart';
import 'package:trs_abf/application/common/db/provier/pay_detail_provider.dart';
import 'package:trs_abf/application/common/event/main_event.dart';
import 'package:trs_abf/framework/plugin/plugin.dart';
import 'action.dart';
import 'state.dart';

Effect<PayDetailState> buildEffect() {
  return combineEffects(<Object, Effect<PayDetailState>>{
    PayDetailAction.action: _onAction,
    PayDetailAction.selectCurrency: _selectCurrency,
    PayDetailAction.save: _save,
    PayDetailAction.selectCountry: _selectCountry,
    Lifecycle.initState: _initState,
  });
}

void _onAction(Action action, Context<PayDetailState> ctx) {}

void _initState(Action action, Context<PayDetailState> ctx) {
  PayDetailProvider().select().then((List<Map<String, dynamic>> mList) {
    if (!ObjectUtil.isEmptyList(mList))
      ctx.dispatch(PayDetailActionCreator.onInitDataAction(mList[0]));
  });
}

void _save(Action action, Context<PayDetailState> ctx) {
  var state = ctx.state;
  if (!state.checkAsZp && !state.checkAsAccount && !state.checkXyk) {
    Fluttertoast.showToast(msg: '请选择退税方式');
    return;
  }
  if (state.checkXyk) {
    PayDetailProvider().insert({
      PayDetailProvider.channel: CommonData.channelXyk,
    }).then((count) {
      _saveSuccess(ctx.context);
    });
  } else if (state.checkAsAccount) {
    _handlerAsAccount(state, ctx);
  } else {
    _handlerZpSave(state, ctx);
  }
}

void _handlerAsAccount(PayDetailState state, Context<PayDetailState> ctx) {
  if (ObjectUtil.isEmptyString(state.accountName)) {
    Fluttertoast.showToast(msg: '请输入账户名');
    return;
  }
  if (ObjectUtil.isEmptyString(state.bsbNumber)) {
    Fluttertoast.showToast(msg: '请输入账号');
    return;
  }
  if (ObjectUtil.isEmptyString(state.account)) {
    Fluttertoast.showToast(msg: '请输入BSB号码');
    return;
  }
  PayDetailProvider().insert({
    PayDetailProvider.channel: CommonData.channelAsAccount,
    PayDetailProvider.accountName: state.accountName,
    PayDetailProvider.account: state.account,
    PayDetailProvider.bsbNumber: state.bsbNumber,
  }).then((count) {
    _saveSuccess(ctx.context);
  });
}

void _handlerZpSave(PayDetailState state, Context<PayDetailState> ctx) {
  if (ObjectUtil.isEmptyString(state.currency)) {
    Fluttertoast.showToast(msg: '请选择退税币种');
    return;
  }
  if (ObjectUtil.isEmptyString(state.lastName)) {
    Fluttertoast.showToast(msg: '请填写姓氏');
    return;
  }
  if (ObjectUtil.isEmptyString(state.name)) {
    Fluttertoast.showToast(msg: '请填写名');
    return;
  }
  if (ObjectUtil.isEmptyString(state.country)) {
    Fluttertoast.showToast(msg: '请填写城市');
    return;
  }
  if (ObjectUtil.isEmptyString(state.addressLineOne)) {
    Fluttertoast.showToast(msg: '请填写地址第一行');
    return;
  }
  if (ObjectUtil.isEmptyString(state.city)) {
    Fluttertoast.showToast(msg: '请选择城市');
    return;
  }
  PayDetailProvider().insert({
    PayDetailProvider.city: state.city,
    PayDetailProvider.country: state.country,
    PayDetailProvider.lastName: state.lastName,
    PayDetailProvider.name: state.name,
    PayDetailProvider.currency: state.currency,
    PayDetailProvider.zipCode: state.zipCode,
    PayDetailProvider.channel: CommonData.channelZp,
    PayDetailProvider.addressLineOne: state.addressLineOne,
    PayDetailProvider.addressLineTwo: state.addressLineTwo,
    PayDetailProvider.pro: state.pro,
  }).then((count) {
    Fluttertoast.showToast(msg: '保存成功');
    SharedPreferencesUtil.putBool(SpKey.IS_FINISH_PAY_DETAIL, true);
    EventBusUtil.instance.eventBus.fire(RefreshMainData());
    RouterUtil.instance.pop(ctx.context);
  });
}

void _saveSuccess(BuildContext context) {
  Fluttertoast.showToast(msg: '保存成功');
  SharedPreferencesUtil.putBool(SpKey.IS_FINISH_PAY_DETAIL, true);
  EventBusUtil.instance.eventBus.fire(RefreshMainData());
  RouterUtil.instance.pop(context);
}

///选择币种
void _selectCurrency(Action action, Context<PayDetailState> ctx) {
  Picker picker = new Picker(
      adapter: PickerDataAdapter<String>(pickerdata: CommonData.currencyList),
      changeToFirst: true,
      textAlign: TextAlign.center,
      columnPadding: const EdgeInsets.all(8.0),
      onConfirm: (Picker picker, List value) {
        ctx.dispatch(PayDetailActionCreator.onConfirmSelectCurrencyAction(
            picker.getSelectedValues()[0]));
      });
  picker.show(ctx.state.key.currentState);
}

///选择币种
void _selectCountry(Action action, Context<PayDetailState> ctx) {
  Picker picker = new Picker(
      adapter: PickerDataAdapter<String>(pickerdata: CommonData.countryList),
      changeToFirst: true,
      textAlign: TextAlign.center,
      columnPadding: const EdgeInsets.all(8.0),
      onConfirm: (Picker picker, List value) {
        ctx.dispatch(PayDetailActionCreator.onConfirmSelectCountryAction(
            picker.getSelectedValues()[0]));
      });
  picker.show(ctx.state.key.currentState);
}

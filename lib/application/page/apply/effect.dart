import 'package:fish_redux/fish_redux.dart';
import 'package:trs_abf/application/common/db/db_helper.dart';
import 'package:trs_abf/application/common/db/provier/invoice_provider.dart';
import 'package:trs_abf/application/common/db/provier/pay_detail_provider.dart';
import 'package:trs_abf/application/common/db/provier/travel_provider.dart';
import 'package:trs_abf/application/common/plugin/constant.dart';
import 'package:trs_abf/framework/plugin/plugin.dart';
import 'action.dart';
import 'state.dart';

Effect<MyApplyState> buildEffect() {
  return combineEffects(<Object, Effect<MyApplyState>>{
    MyApplyAction.action: _onAction,
    Lifecycle.initState: _initData
  });
}

void _onAction(Action action, Context<MyApplyState> ctx) {}

void _initData(Action action, Context<MyApplyState> ctx) {
  _initLocalData().then((data) {
    if (!ObjectUtil.isEmpty(data['payDetail'])) {
      print(data['payDetail']);
      ctx.dispatch(MyApplyActionCreator.onInitDataAction(data));
    }
  });
}

Future<Map<String, dynamic>> _initLocalData() async {
  var invoiceList = await getInvoiceItem();
  var payDetailList = await PayDetailProvider().select();
  var travelList = await TravelProvider().query();

  return {
    'invoiceList': ObjectUtil.isEmptyList(invoiceList)
        ? List()
        : CommonFunction.converterData(invoiceList,
            leaveDate: travelList[0][TravelProvider.selectLeaveData]),
    'payDetail':
        ObjectUtil.isEmptyList(payDetailList) ? null : payDetailList[0],
    'travelDetail': ObjectUtil.isEmptyList(travelList) ? null : travelList[0],
    'invoiceAllMoney': CommonFunction.getInvoiceAllMoney(invoiceList),
    'invoiceAllReturnMoney': '90',
  };
}

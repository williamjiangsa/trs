import 'package:fish_redux/fish_redux.dart';
import 'package:trs_abf/application/page/apply/page.dart';
import 'package:trs_abf/application/page/info/page.dart';
import 'package:trs_abf/application/page/invoice/page.dart';
import 'package:trs_abf/application/page/pay/page.dart';
import 'package:trs_abf/application/page/travel/page.dart';
import 'package:trs_abf/framework/plugin/plugin.dart';
import 'action.dart';
import 'bean/home_item_bean.dart';
import 'state.dart';
import 'package:trs_abf/application/common/common_app_plugin.dart';

Reducer<MainState> buildReducer() {
  return asReducer(
    <Object, Reducer<MainState>>{
      MainAction.action: _onAction,
      MainAction.initHomeListData: _onInitHomeListDataAction,
    },
  );
}

MainState _onAction(MainState state, Action action) {
  final MainState newState = state.clone();
  return newState;
}

MainState _onInitHomeListDataAction(MainState state, Action action) {
  final MainState newState = state.clone();
  List<HomeItemBean> mList = List();
  List<HomeChildItem> homeChildList = List();
  homeChildList.add(new HomeChildItem('信息', InfoPage().buildPage({}), false));

  mList.add(HomeItemBean('步骤 1 ) 先阅读这些信息', homeChildList));

  List<HomeChildItem> twoChildList = List();
  twoChildList.add(new HomeChildItem(
      '我的旅行详情',
      TravelDetailsPage().buildPage({}),
      SharedPreferencesUtil.getBool(SpKey.IS_FINISH_TRAVEL)));
  twoChildList.add(new HomeChildItem('我的发票', MyInvoicePage().buildPage({}),
      SharedPreferencesUtil.getBool(SpKey.IS_FINISH_INVOICE)));
  twoChildList.add(new HomeChildItem('我的付款详情', PayDetailPage().buildPage({}),
      SharedPreferencesUtil.getBool(SpKey.IS_FINISH_PAY_DETAIL)));
  mList.add(HomeItemBean('步骤 2 ) 完成以下三个部分', twoChildList));

  List<HomeChildItem> threeChildList = List();
  threeChildList.add(new HomeChildItem(
      '出示我的申请',
      MyApplyPage().buildPage({}),
      SharedPreferencesUtil.getBool(SpKey.IS_FINISH_TRAVEL) &&
          SharedPreferencesUtil.getBool(SpKey.IS_FINISH_INVOICE) &&
          SharedPreferencesUtil.getBool(SpKey.IS_FINISH_PAY_DETAIL)));
  mList.add(HomeItemBean('步骤 3 ) 在机场', threeChildList));

  List<HomeChildItem> fourChildList = List();
  fourChildList.add(new HomeChildItem('删除发票', null, false));
  fourChildList.add(new HomeChildItem('删除申请', null, false));
  mList.add(HomeItemBean('删除手机中的申请数据', fourChildList));
  newState.data = mList;
  return newState;
}

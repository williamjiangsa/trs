import 'package:fish_redux/fish_redux.dart';
import 'package:trs_abf/application/page/main/bean/home_item_bean.dart';
import 'package:trs_abf/application/page/main/item/component.dart';

import '../state.dart';
import 'reducer.dart';

class MainAdapter extends DynamicFlowAdapter<MainState> {
  MainAdapter()
      : super(
          pool: <String, Component<Object>>{'item': ChildItemComponent()},
          connector: _MainConnector(),
          reducer: buildReducer(),
        );
}

class _MainConnector extends ConnOp<MainState, List<ItemBean>> {
  @override
  List<ItemBean> get(MainState state) {
    return state.data.map((HomeItemBean uploadImageBean) {
      return new ItemBean('item', uploadImageBean);
    }).toList();
  }

  @override
  void set(MainState state, List<ItemBean> items) {
    if (items?.isNotEmpty == true) {
      state.data = List<HomeItemBean>.from(
          items.map<HomeItemBean>((ItemBean bean) => bean.data).toList());
    } else {
      state.data = <HomeItemBean>[];
    }
  }

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}

import 'package:fish_redux/fish_redux.dart';
import 'package:trs_abf/application/page/info/bean/info_item_bean.dart';
import 'package:trs_abf/application/page/info/item/component.dart';

import '../state.dart';
import 'reducer.dart';

class InfoAdapter extends DynamicFlowAdapter<InfoState> {
  InfoAdapter()
      : super(
          pool: <String, Component<Object>>{
            'item':ChildItemComponent()
          },
          connector: _InfoConnector(),
          reducer: buildReducer(),
        );
}

class _InfoConnector extends ConnOp<InfoState, List<ItemBean>> {
  @override
  List<ItemBean> get(InfoState state) {
    return state.data.map((InfoItemBean uploadImageBean) {
      return new ItemBean('item', uploadImageBean);
    }).toList();
  }

  @override
  void set(InfoState state, List<ItemBean> items) {
  }

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}

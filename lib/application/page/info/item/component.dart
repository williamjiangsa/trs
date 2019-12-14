import 'package:fish_redux/fish_redux.dart';
import 'package:trs_abf/application/page/info/bean/info_item_bean.dart';
import 'package:trs_abf/application/page/main/bean/home_item_bean.dart';

import 'view.dart';

class ChildItemComponent extends Component<InfoItemBean> {
  ChildItemComponent()
      : super(
            view: buildView,
            dependencies: Dependencies<InfoItemBean>(
                adapter: null,
                slots: <String, Dependent<InfoItemBean>>{
                }),);

}

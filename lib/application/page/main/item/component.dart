import 'package:fish_redux/fish_redux.dart';
import 'package:trs_abf/application/page/main/bean/home_item_bean.dart';

import 'view.dart';

class ChildItemComponent extends Component<HomeItemBean> {
  ChildItemComponent()
      : super(
            view: buildView,
            dependencies: Dependencies<HomeItemBean>(
                adapter: null,
                slots: <String, Dependent<HomeItemBean>>{
                }),);

}

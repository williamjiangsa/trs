import 'package:fish_redux/fish_redux.dart';

import 'bean/info_item_bean.dart';

class InfoState implements Cloneable<InfoState> {
  List<InfoItemBean> data;

  @override
  InfoState clone() {
    return InfoState()..data = data;
  }
}

InfoState initState(Map<String, dynamic> args) {
  return InfoState()..data = List();
}

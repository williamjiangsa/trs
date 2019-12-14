import 'package:fish_redux/fish_redux.dart';

import 'bean/home_item_bean.dart';

class MainState implements Cloneable<MainState> {
  List<HomeItemBean> data;

  @override
  MainState clone() {
    return MainState()..data = data;
  }
}

MainState initState(Map<String, dynamic> args) {
  return MainState()..data = List();
}

import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum InfoAction { action ,initInfoListData}

class InfoActionCreator {
  static Action onAction() {
    return const Action(InfoAction.action);
  }

  static Action onInitInfoListDataAction() {
    return const Action(InfoAction.initInfoListData);
  }
}

import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MyApplyAction { action, initData }

class MyApplyActionCreator {
  static Action onAction() {
    return const Action(MyApplyAction.action);
  }

  static Action onInitDataAction(data) {
    return Action(MyApplyAction.initData, payload: data);
  }
}

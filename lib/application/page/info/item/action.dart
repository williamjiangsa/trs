import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ChildItemAction { action }

class ChildItemActionCreator {
  static Action onAction() {
    return const Action(ChildItemAction.action);
  }
}

import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<InfoState> buildEffect() {
  return combineEffects(<Object, Effect<InfoState>>{
    Lifecycle.initState: _initState,
    InfoAction.action: _onAction,
  });
}

void _onAction(Action action, Context<InfoState> ctx) {
}

void _initState(Action action, Context<InfoState> ctx) {
  ctx.dispatch(InfoActionCreator.onInitInfoListDataAction());
}

import 'package:fish_redux/fish_redux.dart';
import 'package:trs_abf/application/page/main/page.dart';
import 'package:trs_abf/framework/plugin/plugin.dart';
import 'action.dart';
import 'state.dart';
import 'package:fluttertoast/fluttertoast.dart';

Effect<TermsState> buildEffect() {
  return combineEffects(<Object, Effect<TermsState>>{
    TermsAction.action: _onAction,
    TermsAction.next: _onNextAction,
  });
}

void _onAction(Action action, Context<TermsState> ctx) {}

void _onNextAction(Action action, Context<TermsState> ctx) {
  if (ctx.state.isAgree) {
    RouterUtil.instance.push(ctx.context, MainPage().buildPage({}));
  } else {
    Fluttertoast.showToast(msg: '请先勾选协议');
  }
}

import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<TermsState> buildReducer() {
  return asReducer(
    <Object, Reducer<TermsState>>{
      TermsAction.action: _onAction,
      TermsAction.agree:_onAgreeAction,
    },
  );
}

TermsState _onAction(TermsState state, Action action) {
  final TermsState newState = state.clone();
  return newState;
}


TermsState _onAgreeAction(TermsState state, Action action) {
  final TermsState newState = state.clone();
  newState.isAgree=!newState.isAgree;
  return newState;
}

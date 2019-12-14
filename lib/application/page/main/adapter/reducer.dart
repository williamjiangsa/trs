import 'package:fish_redux/fish_redux.dart';

import '../state.dart';


Reducer<MainState> buildReducer() {
  return asReducer(
    <Object, Reducer<MainState>>{

    },
  );
}

MainState _onAction(MainState state, Action action) {
  final MainState newState = state.clone();
  return newState;
}

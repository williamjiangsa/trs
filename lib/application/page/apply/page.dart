import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MyApplyPage extends Page<MyApplyState, Map<String, dynamic>> {
  MyApplyPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MyApplyState>(
                adapter: null,
                slots: <String, Dependent<MyApplyState>>{
                }),
            middleware: <Middleware<MyApplyState>>[
            ],);

}

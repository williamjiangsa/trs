import 'package:fish_redux/fish_redux.dart';

import 'adapter/adapter.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MainPage extends Page<MainState, Map<String, dynamic>> {
  MainPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MainState>(
                adapter: MainAdapter(),
                slots: <String, Dependent<MainState>>{
                }),
            middleware: <Middleware<MainState>>[
            ],);

}

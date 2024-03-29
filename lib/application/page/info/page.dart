import 'package:fish_redux/fish_redux.dart';

import 'adapter/adapter.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class InfoPage extends Page<InfoState, Map<String, dynamic>> {
  InfoPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<InfoState>(
                adapter: InfoAdapter(),
                slots: <String, Dependent<InfoState>>{
                }),
            middleware: <Middleware<InfoState>>[
            ],);

}

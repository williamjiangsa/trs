import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PayDetailPage extends Page<PayDetailState, Map<String, dynamic>> {
  PayDetailPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PayDetailState>(
                adapter: null,
                slots: <String, Dependent<PayDetailState>>{
                }),
            middleware: <Middleware<PayDetailState>>[
            ],);

}

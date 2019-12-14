import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class TermsPage extends Page<TermsState, Map<String, dynamic>> {
  TermsPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<TermsState>(
                adapter: null,
                slots: <String, Dependent<TermsState>>{
                }),
            middleware: <Middleware<TermsState>>[
            ],);

}

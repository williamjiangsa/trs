import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class TravelDetailsPage extends Page<TravelDetailsState, Map<String, dynamic>> {
  TravelDetailsPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<TravelDetailsState>(
                adapter: null,
                slots: <String, Dependent<TravelDetailsState>>{
                }),
            middleware: <Middleware<TravelDetailsState>>[
            ],);

}

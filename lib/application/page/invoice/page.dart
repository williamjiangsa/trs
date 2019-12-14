import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MyInvoicePage extends Page<MyInvoiceState, Map<String, dynamic>> {
  MyInvoicePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MyInvoiceState>(
                adapter: null,
                slots: <String, Dependent<MyInvoiceState>>{
                }),
            middleware: <Middleware<MyInvoiceState>>[
            ],);

}

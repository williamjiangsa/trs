import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AddInvoicePage extends Page<AddInvoiceState, Map<String, dynamic>> {
  AddInvoicePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<AddInvoiceState>(
                adapter: null,
                slots: <String, Dependent<AddInvoiceState>>{
                }),
            middleware: <Middleware<AddInvoiceState>>[
            ],);

}

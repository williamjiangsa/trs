import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AddNewInvoicePage extends Page<AddNewInvoiceState, Map<String, dynamic>> {
  AddNewInvoicePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<AddNewInvoiceState>(
                adapter: null,
                slots: <String, Dependent<AddNewInvoiceState>>{
                }),
            middleware: <Middleware<AddNewInvoiceState>>[
            ],);

}

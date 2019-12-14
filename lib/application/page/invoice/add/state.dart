import 'dart:convert';

import 'package:fish_redux/fish_redux.dart';
import 'package:trs_abf/application/common/db/provier/invoice_provider.dart';
import 'package:trs_abf/application/common/db/provier/travel_child_item_provider.dart';

class AddInvoiceState implements Cloneable<AddInvoiceState> {
  String confirmDate;
  String abnNumber;
  String invoiceNumber;
  List invoiceList;
  int invoiceChildItemId;

  @override
  AddInvoiceState clone() {
    return AddInvoiceState()
      ..abnNumber = abnNumber
      ..invoiceNumber = invoiceNumber
      ..invoiceList = invoiceList
      ..confirmDate = confirmDate
      ..invoiceChildItemId = invoiceChildItemId;
  }
}

AddInvoiceState initState(Map<String, dynamic> args) {
  var data = args['data'];
  if (data != null) {
//    var list = List();
//    list.add(args['childData']);
    return AddInvoiceState()
      ..abnNumber = data[InvoiceProvider.abnNumber]
      ..invoiceNumber = data[TravelChildItemProvider.invoiceNumber]
      ..invoiceList =
          JsonDecoder().convert(data[TravelChildItemProvider.childItemJson])
      ..confirmDate = data[TravelChildItemProvider.date]
      ..invoiceChildItemId = data['id'];
  } else {
    return AddInvoiceState()
      ..abnNumber = ''
      ..invoiceNumber = ''
      ..invoiceList = List()
      ..confirmDate = '请选择发票日期';
  }
}

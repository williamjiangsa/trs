import 'package:fish_redux/fish_redux.dart';

class MyInvoiceState implements Cloneable<MyInvoiceState> {
  String invoiceNum;
  String invoiceAllMoney;
  String invoiceAllReturnMoney;
  Map itemListMap;

  @override
  MyInvoiceState clone() {
    return MyInvoiceState()
      ..invoiceNum = invoiceNum
      ..invoiceAllMoney = invoiceAllMoney
      ..invoiceAllReturnMoney = invoiceAllReturnMoney
      ..itemListMap = itemListMap;
  }
}

MyInvoiceState initState(Map<String, dynamic> args) {
  return MyInvoiceState()
    ..invoiceAllReturnMoney = '0.00'
    ..invoiceAllMoney = '0.00'
    ..invoiceNum = '0'
    ..itemListMap = Map();
}

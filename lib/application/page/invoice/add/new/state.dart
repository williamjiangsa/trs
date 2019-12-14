import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class AddNewInvoiceState implements Cloneable<AddNewInvoiceState> {
  String goodsType;
  String money;
  GlobalKey key;

  @override
  AddNewInvoiceState clone() {
    return AddNewInvoiceState()
      ..goodsType = goodsType
      ..money = money
      ..key = key;
  }
}

AddNewInvoiceState initState(Map<String, dynamic> args) {
  if (args['data'] != null) {
    return AddNewInvoiceState()
      ..goodsType = args['data']['goodsType']
      ..money = args['data']['money']
      ..key = GlobalKey();
  } else {
    return AddNewInvoiceState()
      ..goodsType = '请选择商品类别'
      ..money = ''
      ..key = GlobalKey();
  }
}

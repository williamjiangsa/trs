import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class PayDetailState implements Cloneable<PayDetailState> {
  String lastName;
  String name;
  String country;
  String addressLineOne;
  String addressLineTwo;
  String city;
  String pro;
  String zipCode;
  bool checkXyk;
  bool checkAsAccount;
  bool checkAsZp;
  GlobalKey key;

  String account;
  String bsbNumber;
  String accountName;

  ///币种
  String currency;

  @override
  PayDetailState clone() {
    return PayDetailState()
      ..lastName = lastName
      ..zipCode = zipCode
      ..name = name
      ..addressLineOne = addressLineOne
      ..addressLineTwo = addressLineTwo
      ..pro = pro
      ..country = country
      ..city = city
      ..checkAsAccount = checkAsAccount
      ..checkAsZp = checkAsZp
      ..checkXyk = checkXyk
      ..key = key
      ..currency = currency
      ..accountName = accountName
      ..account = account
      ..bsbNumber = bsbNumber;
  }
}

PayDetailState initState(Map<String, dynamic> args) {
  return PayDetailState()
    ..lastName = ''
    ..name = ''
    ..city = ''
    ..country = '请选择国家'
    ..checkXyk = false
    ..checkAsZp = false
    ..checkAsAccount = false
    ..key = GlobalKey()
    ..currency = '请选择币种'
    ..pro = ''
    ..bsbNumber = ''
    ..account = ''
    ..accountName = '';
}

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class TravelDetailsState implements Cloneable<TravelDetailsState> {
  String confirmDate;
  GlobalKey<ScaffoldState> key;
  String confirmCountry;
  String number;
  bool isAsPerson;

  @override
  TravelDetailsState clone() {
    return TravelDetailsState()
      ..confirmDate = confirmDate
      ..key = key
      ..confirmCountry = confirmCountry
      ..number = number
      ..isAsPerson = isAsPerson;
  }
}

TravelDetailsState initState(Map<String, dynamic> args) {
  return TravelDetailsState()
    ..confirmDate = '请选择离开日期'
    ..key = GlobalKey()
    ..confirmCountry = '请选择护照签发国家/地区'
    ..number = ''
    ..isAsPerson = false;
}

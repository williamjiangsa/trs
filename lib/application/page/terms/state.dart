import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class TermsState implements Cloneable<TermsState> {
  GlobalKey<DrawerControllerState> key;

  bool isAgree;

  @override
  TermsState clone() {
    return TermsState()
      ..key = key
      ..isAgree = isAgree;
  }
}

TermsState initState(Map<String, dynamic> args) {
  return TermsState()
    ..key = GlobalKey()
    ..isAgree = false;
}

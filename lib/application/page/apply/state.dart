import 'package:fish_redux/fish_redux.dart';
import 'package:trs_abf/application/common/db/provier/pay_detail_provider.dart';
import 'package:trs_abf/application/common/db/provier/travel_provider.dart';

class MyApplyState implements Cloneable<MyApplyState> {
  Map itemListMap;
  Map payDetail;
  Map travelDetail;
  String invoiceAllMoney;
  String invoiceAllReturnMoney;

  @override
  MyApplyState clone() {
    return MyApplyState()
      ..itemListMap = itemListMap
      ..payDetail = payDetail
      ..travelDetail = travelDetail
      ..invoiceAllReturnMoney = invoiceAllReturnMoney
      ..invoiceAllMoney = invoiceAllMoney;
  }
}

MyApplyState initState(Map<String, dynamic> args) {
  return MyApplyState()
    ..payDetail = {
      PayDetailProvider.channel: '',
      PayDetailProvider.city: '',
      PayDetailProvider.addressLineTwo: '',
      PayDetailProvider.addressLineOne: '',
      PayDetailProvider.country: '',
      PayDetailProvider.lastName: '',
      PayDetailProvider.currency: '',
      PayDetailProvider.zipCode: '',
      PayDetailProvider.pro: ''
    }
    ..travelDetail = {
      TravelProvider.selectLeaveData: '',
      TravelProvider.isLocalPerson: '',
      TravelProvider.number: '',
      TravelProvider.selectCountry: '',
    }
    ..itemListMap = {}
    ..invoiceAllMoney = ''
    ..invoiceAllReturnMoney = '';
}

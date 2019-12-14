import 'dart:convert';

import 'package:trs_abf/application/common/db/provier/invoice_provider.dart';
import 'package:trs_abf/application/common/db/provier/travel_child_item_provider.dart';
import 'package:trs_abf/framework/plugin/plugin.dart';

class SpKey {
  //是否填写完成我的旅行
  static const String IS_FINISH_TRAVEL = 'isFinishTravel';

  //是否填写完成我的发票
  static const String IS_FINISH_INVOICE = 'isFinishInvoice';

  //是否填写完成的付款
  static const String IS_FINISH_PAY_DETAIL = 'isFinishPayDetail';
}

class CommonData {
  static var countryList = ['澳大利亚', '中国', '美国'];
  static var currencyList = [
    '澳元',
    '英镑',
    '加拿大元',
    '欧元-法国',
    '欧元-德国',
    '欧元-爱尔兰',
    '港币',
    '日币',
    '新西兰元',
    '新加坡元',
    '瑞士法郎',
    '美元',
  ];
  static var invoiceItemList = [
    '艺术品/画作',
    '包袋/钱包',
    '照相机/摄影机',
    '服装/鞋类',
    '电脑/平板电脑',
    '化妆品/梳妆用品',
    '眼镜',
    '家居用品',
    '营养补充品/维生素',
    '珠宝/手表',
    '其他',
    'IPhone/智能手机',
    '运动器械',
    '酒类'
  ];
  static String channelXyk = '1';
  static String channelAsAccount = '2';
  static String channelZp = '3';

  ///报销比例
  static double returnRatio = 0.0909;
}

class CommonFunction {
  static double calculate(List mList) {
    double money = 0.00;
    print(mList.length);
    for (int i = 0; i < mList.length; i++) {
      money += double.parse(mList[i]['money']);
    }
    return money;
  }

  static double calculateInvoiceItemAllMoney(List mList) {
    double money = 0.00;
    for (int i = 0; i < mList.length; i++) {
      if (ObjectUtil.isEmptyString(
          mList[i]['${TravelChildItemProvider.childItemJson}'])) return 0.00;
      List childItemList = JsonDecoder()
          .convert(mList[i]['${TravelChildItemProvider.childItemJson}']);
      for (int i = 0; i < childItemList.length; i++) {
        money += double.parse(childItemList[i]['money']);
      }
    }
    return money;
  }

  static double getInvoiceAllMoney(List<Map<String, dynamic>> data) {
    if (ObjectUtil.isEmptyList(data)) return 0.00;
    double invoiceAllMoney = 0.00;
    for (int i = 0; i < data.length; i++) {
      if (!ObjectUtil.isEmptyString(
          data[i][TravelChildItemProvider.childItemJson])) {
        List invoiceChildItemList = JsonDecoder()
            .convert(data[i][TravelChildItemProvider.childItemJson]);
        for (int j = 0; j < invoiceChildItemList.length; j++) {
          invoiceAllMoney += double.parse(invoiceChildItemList[j]['money']);
        }
      }
    }
    return invoiceAllMoney;
  }

  static Map<String, List> converterData(List<Map<String, dynamic>> dataList,
      {String leaveDate}) {
    Map<String, List> mapList = new Map();
    for (int i = 0; i < dataList.length; i++) {
      if (!ObjectUtil.isEmpty(
              dataList[i][TravelChildItemProvider.childItemJson]) &&
          !ObjectUtil.isEmpty(leaveDate)) {
        var difference = DateTime.parse(_transformDate(leaveDate)).difference(
            DateTime.parse(
                _transformDate(dataList[i][TravelChildItemProvider.date])));
        //如果提起超过60天 则不添加
        if (difference.inDays.abs() > 60) {
          continue;
        }
      }

      print(dataList[i]);

      if (mapList.containsKey(dataList[i][InvoiceProvider.abnNumber])) {
        List list = mapList['${dataList[i]['${InvoiceProvider.abnNumber}']}'];
        list.add(dataList[i]);
        mapList[dataList[i]['${InvoiceProvider.abnNumber}']] = list;
      } else {
        var list = List();
        list.add(dataList[i]);
        mapList[dataList[i]['${InvoiceProvider.abnNumber}']] = list;
      }
    }
    return mapList;
  }

  static String _transformDate(String leaveDate) {
    var date = '';
    var split = leaveDate.split('/');
    for (int i = 0; i < split.length; i++) {
      var split2 = split[split.length - (i + 1)];
      if (split2.length <= 1) {
        split2 = '0$split2';
      }
      date += split2;
    }
    return date;
  }
}

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:trs_abf/application/common/common_app_plugin.dart';
import 'package:trs_abf/application/common/common_widget.dart';
import 'package:trs_abf/application/common/db/provier/invoice_provider.dart';
import 'package:trs_abf/application/common/db/provier/pay_detail_provider.dart';
import 'package:trs_abf/application/common/db/provier/travel_child_item_provider.dart';
import 'package:trs_abf/application/common/db/provier/travel_provider.dart';
import 'package:trs_abf/application/common/widget/qr_image.dart';
import 'package:trs_abf/framework/base.dart';
import 'package:trs_abf/framework/plugin/plugin.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    MyApplyState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: DefaultToolBar(
      title: '出示我的申请',
    ),
    body: CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            children: <Widget>[
              _renderTitleItem('请注意，本申请包含不符合退税资格要求的发票', Colors.red,
                  defaultBgColor, viewService.context),
              _renderTitleItem(
                  '我的旅行详情', Colors.white, Colors.blue, viewService.context),
              Padding(
                padding: EdgeInsets.only(top: 12),
                child: _renderTextItem('护照签发国家/地区',
                    state.travelDetail[TravelProvider.selectCountry]),
              ),
              _renderTextItem(
                  '护照号码', state.travelDetail[TravelProvider.number]),
              _renderTextItem(
                  '是否是澳大利亚居民',
                  state.travelDetail[TravelProvider.isLocalPerson] == '1'
                      ? '是'
                      : '否'),
              _renderTextItem(
                  '出境日期', state.travelDetail[TravelProvider.selectLeaveData]),
              _renderTitleItem(
                  '我的发票', Colors.white, Colors.blue, viewService.context),
              Column(children: _renderAllItem(state)),
              _renderItem(state, viewService),
              Container(
                child: QrImage(
                    data: "这里是需要生成二维码的数据",
                    size: 100.0,
                    onError: (ex) {
                      print("[QR] ERROR - $ex");
                    }),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

List<Widget> _renderAllItem(MyApplyState state) {
  List<Widget> mList = List();
  state.itemListMap.forEach((key, value) {
    if (value.length > 0 && ObjectUtil.isEmpty(value[0]['childItemJson'])) {
      mList.add(Container(
        width: 0,
        height: 0,
      ));
      return mList;
    }
    double calculate = CommonFunction.calculateInvoiceItemAllMoney(value);
    if (calculate < 300) {
      mList.add(Container(
        width: 0,
        height: 0,
      ));
      return mList;
    }
    mList.add(Container(
      padding: EdgeInsets.only(top: 12),
      color: defaultBgColor,
      child: Column(
        children: <Widget>[
          _renderTextItem('ABN', key),
          _renderTextItem('在此ABN消费的总额', '\$ ${calculate.toStringAsFixed(2)}'),
          _renderTextItem('估计退税金额',
              '\$ ${(calculate * CommonData.returnRatio).toStringAsFixed(2)}'),
          Column(
              children: List<Widget>.from(value.map((mData) {
            return _renderChildItem(mData);
          }).toList()))
        ],
      ),
    ));
  });

  return mList;
}

Widget _renderChildItem(data) {
  //发票项目列表
  List childItemList =
      JsonDecoder().convert(data['${TravelChildItemProvider.childItemJson}']);
  var money = 0.00;
  return Container(
    margin: EdgeInsets.only(bottom: 1),
    padding: EdgeInsets.only(top: 6, bottom: 6),
    color: Colors.white,
    child: Row(
      children: <Widget>[
        Expanded(
            child: Column(
          children: <Widget>[
            _renderTextItem(
                '发票号码', data[TravelChildItemProvider.invoiceNumber]),
            _renderTextItem('发票日期', data[TravelChildItemProvider.date]),
            Column(
                children: List<Widget>.from(childItemList.map((data) {
              money += double.parse(data[TravelChildItemProvider.money]);
              return _renderTextItem(
                  '${data[TravelChildItemProvider.goodsType]}',
                  '\$ ${double.parse(data['${TravelChildItemProvider.money}']).toStringAsFixed(2)}');
            }).toList())),
            _renderTextItem('发票金额', '\$ ${money.toStringAsFixed(2)}'),
          ],
        )),
      ],
    ),
  );
}

Widget _renderItem(MyApplyState state, ViewService viewService) {
  Widget mWidget = Container(
    width: 0,
    height: 0,
  );
  var channel = state.payDetail[PayDetailProvider.channel];
  switch (channel) {
    case '1':
      mWidget = Container(
        width: 0,
        height: 0,
      );
      break;
    case '2':
      mWidget = Column(
        children: <Widget>[
          _renderTextItem(
              '账户名', state.payDetail[PayDetailProvider.accountName]),
          _renderTextItem(
              'BSB 号码', state.payDetail[PayDetailProvider.bsbNumber]),
          _renderTextItem('账号', state.payDetail[PayDetailProvider.account]),
        ],
      );
      break;
    case '3':
      mWidget = Column(
        children: <Widget>[
          _renderTextItem('所有的发票总金额', '\$ ${state.invoiceAllMoney}',
              leftTextColor: Colors.white,
              rightTextColor: Colors.white,
              bgColor: Colors.blue,
              top: 6),
          _renderTextItem('估计退税总金额', '\$ ${state.invoiceAllReturnMoney}',
              leftTextColor: Colors.white,
              rightTextColor: Colors.white,
              bgColor: Colors.blue,
              top: 6),
          _renderTextItem('付款方式', '支票',
              leftTextColor: Colors.white,
              rightTextColor: Colors.white,
              bgColor: Colors.blue,
              top: 6),
          Padding(
            padding: EdgeInsets.only(top: 12),
            child: _renderTextItem(
                '退税支票币种', state.payDetail[PayDetailProvider.currency]),
          ),
          _renderTextItem(
              'Family Name', state.payDetail[PayDetailProvider.lastName]),
          _renderTextItem(
              'Given Name', state.payDetail[PayDetailProvider.name]),
          _renderTextItem('Address LineOne',
              state.payDetail[PayDetailProvider.addressLineOne]),
          _renderTextItem('Address LineTwo',
              state.payDetail[PayDetailProvider.addressLineTwo]),
          _renderTextItem('City', state.payDetail[PayDetailProvider.city]),
          _renderTextItem('State', state.payDetail[PayDetailProvider.city]),
          _renderTextItem(
              'PosTal/Zip Code', state.payDetail[PayDetailProvider.zipCode]),
          _renderTextItem(
              'Country', state.payDetail[PayDetailProvider.country]),
        ],
      );
      break;
  }
  return mWidget;
}

_renderTitleItem(String s, Color color, Color bgColor, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    color: bgColor,
    padding: EdgeInsets.only(top: 6, bottom: 6, left: 12),
    child: Text(
      s,
      style: TextStyle(color: color),
    ),
  );
}

_renderTextItem(leftText, rightText,
    {double top = 0,
    double bottom = 6,
    double left = 12,
    double right = 12,
    leftTextColor,
    rightTextColor,
    Color bgColor}) {
  if (ObjectUtil.isEmpty(rightText)) {
    rightText = '';
  }
  return Container(
    color: bgColor,
    padding:
        EdgeInsets.only(top: top, left: left, right: right, bottom: bottom),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          leftText,
          style: TextStyle(color: leftTextColor),
        ),
        Text(
          rightText,
          style: TextStyle(color: rightTextColor),
        )
      ],
    ),
  );
}

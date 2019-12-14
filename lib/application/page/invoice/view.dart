import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:trs_abf/application/common/common_app_plugin.dart';
import 'package:trs_abf/application/common/common_widget.dart';
import 'package:trs_abf/application/common/db/provier/invoice_provider.dart';
import 'package:trs_abf/application/common/db/provier/travel_child_item_provider.dart';
import 'package:trs_abf/application/page/info/bean/info_item_bean.dart';
import 'package:trs_abf/framework/base.dart';
import 'package:trs_abf/framework/plugin/plugin.dart';
import 'action.dart';
import 'add/new/page.dart';
import 'add/page.dart';
import 'state.dart';

Widget buildView(
    MyInvoiceState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: DefaultToolBar(
      title: '我的发票',
      rightWidget: IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.white,
            size: 24,
          ),
          onPressed: () {
            RouterUtil.instance
                .push(viewService.context, AddInvoicePage().buildPage({}));
          }),
    ),
    body: Container(
      padding: EdgeInsets.all(6),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                _renderItem('税务发票', '(${state.invoiceNum}/10)'),
                Column(
                  children: _renderAllItem(state, dispatch, viewService),
                ),
                _renderItem('所有发票总金额', '\$ ${state.invoiceAllMoney}'),
                _renderItem('估计退税总金额', '\$ ${state.invoiceAllReturnMoney}'),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

List<Widget> _renderAllItem(
    MyInvoiceState state, Dispatch dispatch, ViewService viewService) {
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
            return _renderChildItem(mData, dispatch, viewService);
          }).toList()))
        ],
      ),
    ));
  });

  return mList;
}

Widget _renderItem(leftText, rightText) {
  return DefaultItemContainer(
    margin: EdgeInsets.only(top: 12, left: 6, right: 6),
    child: Padding(
        padding: EdgeInsets.only(left: 12),
        child: Stack(
          children: <Widget>[
            Text(
              leftText,
              style: TextStyle(color: Colors.white),
            ),
            Positioned(
                right: 6,
                child: Text(rightText, style: TextStyle(color: Colors.white)))
          ],
        )),
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

Widget _renderChildItem(data, Dispatch dispatch, ViewService viewService) {
  //发票项目列表
  List childItemList =
      JsonDecoder().convert(data['${TravelChildItemProvider.childItemJson}']);
  var money = 0.00;
  return GestureDetector(
    child: Container(
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
          Container(
            color: defaultBgColor,
            width: 1,
            height: 100,
            margin: EdgeInsets.only(left: 12, right: 12),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              dispatch(
                  MyInvoiceActionCreator.onDelInvoiceItemAction(data['id']));
            },
          )
        ],
      ),
    ),
    onTap: () {
      RouterUtil.instance.push(viewService.context,
          AddInvoicePage().buildPage({'data': data, 'childData': data}));
    },
  );
}

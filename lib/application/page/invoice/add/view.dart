import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:trs_abf/application/common/common_widget.dart';
import 'package:trs_abf/framework/base.dart';
import 'package:trs_abf/framework/plugin/plugin.dart';

import 'action.dart';
import 'new/page.dart';
import 'state.dart';

Widget buildView(
    AddInvoiceState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: DefaultToolBar(
      title: '我的发票详情',
      rightWidget: Padding(
        padding: EdgeInsets.only(top: kToolbarHeight / 3, right: 12),
        child: GestureDetector(
          onTap: () {
            dispatch(AddInvoiceActionCreator.onSaveAction());
          },
          child: Text(
            '保存',
            style: TextStyle(fontSize: 14),
          ),
        ),
      ),
    ),
    body: Container(
      padding: EdgeInsets.all(12),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                _renderText('ABN(澳大利亚商业号码)', '(必填)'),
                MyEditText(
                  hintText: '请输入澳大利亚商业号码',
                  controller: TextEditingController.fromValue(TextEditingValue(
                      text: state.abnNumber,
                      selection: TextSelection.fromPosition(TextPosition(
                          affinity: TextAffinity.downstream,
                          offset: state.abnNumber.length)))),
                  textChange: (text) {
                    dispatch(
                        AddInvoiceActionCreator.onAbnNumberChangeAction(text));
                  },
                ),
                _renderText('发票号码(如有)', ''),
                MyEditText(
                  hintText: '请输入发票号码',
                  textChange: (text){
                    dispatch(AddInvoiceActionCreator.onInvoiceNumberChangeAction(text));
                  },
                  controller: TextEditingController.fromValue(TextEditingValue(
                      text: state.invoiceNumber,
                      selection: TextSelection.fromPosition(TextPosition(
                          affinity: TextAffinity.downstream,
                          offset: state.invoiceNumber.length)))),
                ),
                _renderText('发票日期', '(必填)'),
                DefaultItemContainer(
                  backgroundColor: Colors.white,
                  titleColor: defaultBlackTextColor,
                  title: state.confirmDate,
                  rightWidget: GestureDetector(
                    child: Icon(Icons.date_range),
                    onTap: () {
                      dispatch(AddInvoiceActionCreator.onSelectDateAction());
                    },
                  ),
                ),
                DefaultItemContainer(
                    onClick: () {
                      RouterUtil.instance.pushAndReceive(viewService.context,
                          AddNewInvoicePage().buildPage({}), (data) {
                        if (data != null)
                          dispatch(
                              AddInvoiceActionCreator.onAddInvoiceChildAction(
                                  data));
                      });
                    },
                    margin: EdgeInsets.only(left: 12, right: 12, top: 24),
                    padding: EdgeInsets.only(left: 12, top: 12, bottom: 12),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text('我的发票项目：',
                                style: TextStyle(color: Colors.white))),
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        )
                      ],
                    )),
                Column(
                    children: state.invoiceList.map((data) {
                  return _renderInvoiceItem(
                      data, viewService.context, dispatch);
                }).toList())
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget _renderText(String s, String t) {
  return Padding(
    padding: EdgeInsets.only(top: 12, bottom: 12),
    child: Row(
      children: <Widget>[
        Text(s),
        Text(
          t,
          style: TextStyle(color: desRed),
        ),
      ],
    ),
  );
}

Widget _renderInvoiceItem(data, BuildContext context, Dispatch dispatch) {
  return DefaultItemContainer(
      margin: EdgeInsets.only(left: 12, right: 12, top: 1),
      padding: EdgeInsets.only(left: 12, top: 12, bottom: 12),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Text('${data['goodsType']}:   ',
                  style: TextStyle(color: Colors.white)),
              Text('\$ ${(double.parse(data['money']).toStringAsFixed(2))}',
                  style: TextStyle(color: Colors.white)),
            ],
          )),
          GestureDetector(
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
            onTap: () {
              dispatch(
                  AddInvoiceActionCreator.onDeleteInvoiceChildAction(data));
            },
          )
        ],
      ));
}

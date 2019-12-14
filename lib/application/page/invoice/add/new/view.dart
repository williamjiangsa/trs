import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:trs_abf/application/common/common_widget.dart';
import 'package:trs_abf/application/common/plugin/number_text_input_formatter.dart';
import 'package:trs_abf/application/page/info/return_invoice_page.dart';
import 'package:trs_abf/framework/plugin/plugin.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    AddNewInvoiceState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    key: state.key,
    appBar: DefaultToolBar(
      title: '我的发票详情',
    ),
    body: Container(
      padding: EdgeInsets.all(12),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                _renderSelectItem('我可以对哪些商品进行退税？', dispatch: () {
                  RouterUtil.instance
                      .push(viewService.context, ReturnInvoicePage());
                },rightIcon: Icons.arrow_right),
                MyTextItem(leftText: '商品类别', rightText: '(必填)'),
                _renderSelectItem(state.goodsType, dispatch: () {
                  dispatch(
                      AddNewInvoiceActionCreator.onSelectGoodsTypeAction());
                }),
                MyTextItem(
                    leftText: '购买可退税商品已支付的金额，包括GST/WET（单位为澳元）', rightText: ''),
                Container(
                  width: MediaQuery.of(viewService.context).size.width,
                  child: Text(
                    '(必填)',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                MyEditText(
                  hintText: '请输入已支付的金额',
                  controller: TextEditingController.fromValue(TextEditingValue(
                      text: state.money,
                      selection: TextSelection.fromPosition(TextPosition(
                          affinity: TextAffinity.downstream,
                          offset: state.money.length)))),
                  formatterList: [NumberTextInputFormatter()],
                  textChange: (text) {
                    dispatch(
                        AddNewInvoiceActionCreator.onMoneyChangeAction(text));
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24),
                  child:
                      _renderBottomButton(viewService.context, state, dispatch),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

_renderBottomButton(
    BuildContext context, AddNewInvoiceState state, Dispatch dispatch) {
  return Row(
    children: <Widget>[
      Expanded(
          child: DefaultItemContainer(
        onClick: () {
          RouterUtil.instance.pop(context);
        },
        title: '取消',
        rightWidget: Container(
          width: 0,
          height: 0,
        ),
      )),
      Expanded(
          child: DefaultItemContainer(
        onClick: () {
          dispatch(AddNewInvoiceActionCreator.onConfirmAction());
        },
        title: '确定',
        rightWidget: Container(
          width: 0,
          height: 0,
        ),
      )),
    ],
  );
}

_renderSelectItem(String tip, {dispatch, rightIcon}) {
  return DefaultItemContainer(
      onClick: () {
        dispatch();
      },
      margin: EdgeInsets.only(left: 12, right: 12, bottom: 12),
      child: Stack(
        children: <Widget>[
          Center(
            child: Text(
              tip,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Positioned(
              right: 6,
              child: GestureDetector(
                  child: Icon(
                rightIcon == null ? Icons.arrow_drop_down : rightIcon,
                color: Colors.white,
              )))
        ],
      ));
}

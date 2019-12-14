import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:trs_abf/application/common/common_widget.dart';
import 'package:trs_abf/application/page/main/action.dart';
import 'package:trs_abf/application/page/main/bean/home_item_bean.dart';
import 'package:trs_abf/framework/plugin/plugin.dart';

Widget buildView(
    HomeItemBean state, Dispatch dispatch, ViewService viewService) {
  return Column(
    children: <Widget>[
      Container(
        width: MediaQuery.of(viewService.context).size.width,
        padding: EdgeInsets.only(top: 18, bottom: 18, left: 12),
        child: Text(
          state.title,
          maxLines: 2,
        ),
      ),
      Column(
          children: state.childItemList.map((HomeChildItem item) {
        return _childItem(item, viewService.context, dispatch);
      }).toList())
    ],
  );
}

Widget _childItem(HomeChildItem item, BuildContext context, Dispatch dispatch) {
  return GestureDetector(
    onTap: () {
      if (item.title == '出示我的申请' && !item.isFinish) {
        Fluttertoast.showToast(msg: '请先填写完成旅行，发票和付款部分');
        return;
      }
      if (item.title == '删除发票') {
        dispatch(MainActionCreator.onDeleteInvoiceDataAction());
        return;
      }
      if (item.title == '删除申请') {
        dispatch(MainActionCreator.onDeleteApplyDataAction());
        return;
      }
      RouterUtil.instance.push(context, item.action);
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: Colors.blue,
      ),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 1, left: 12, right: 12),
      padding: EdgeInsets.only(top: 12, bottom: 12),
      child: Padding(
        padding: EdgeInsets.only(left: 12),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Text(
              item.title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            )),
            GestureDetector(
                child: Icon(
              item.isFinish ? Icons.check : Icons.arrow_right,
              color: Colors.white,
            ))
          ],
        ),
      ),
    ),
  );
}

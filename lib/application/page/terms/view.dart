import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:trs_abf/application/common/common_widget.dart';
import 'package:trs_abf/application/common/plugin/my_special_text_span_builder.dart';
import 'action.dart';
import 'detail/page.dart';
import 'state.dart';
import 'package:trs_abf/framework/plugin/plugin.dart';
import 'package:extended_text/extended_text.dart';

Widget buildView(TermsState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: DefaultToolBar(
      title: '条款',
      showBackButton: true,
    ),
    body: Column(
      children: <Widget>[
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(top: 24, left: 12, right: 12),
          child: ExtendedText(
            '致所有申请人的重要提示您可以在本程序中输入进行游客退税计划(TRS)申请所需的信息。当您完成信息输入后，这些信息将存储在一个QR代码中，并保存在您的手机上。这个QR代码就是您的TRS申请代码。本程序只会保存您最后完成的TRS申请代码当您离开澳大利亚时，您必须向TRS办理台的官员出示您的TRS申请代码。有关本程序使用条件、TRS申请资格规定以及申请流程的详细信息，请阅读下面的 \$TRS信息\$ ',
            maxLines: 100,
            onSpecialTextTap: (data) {
              if (data.startsWith("\$")) {
                RouterUtil.instance.push(viewService.context, TravelDetail());
              }
            },
            specialTextSpanBuilder: MySpecialTextSpanBuilder(),
            overflow: ExtendedTextOverflow.ellipsis,
          ),
        )),
        DefaultItemContainer(
            padding: EdgeInsets.all(0),
            child: Row(
              children: <Widget>[
                Checkbox(
                    value: state.isAgree,
                    onChanged: (bool change) {
                      dispatch(TermsActionCreator.onAgreeAction());
                    }),
                Text('同意', style: TextStyle(color: Colors.white))
              ],
            )),
        Line(),
        DefaultItemContainer(
            onClick: () {
              dispatch(TermsActionCreator.onNextAction());
            },
            margin: EdgeInsets.only(left: 12, right: 12, bottom: 40),
            child: Stack(
              children: <Widget>[
                Center(
                  child: Text(
                    '开始',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Positioned(
                    right: 6,
                    child: Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ))
              ],
            ))
      ],
    ),
  );
}

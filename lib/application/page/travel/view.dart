import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:trs_abf/application/common/common_widget.dart';
import 'action.dart';
import 'state.dart';
import 'package:trs_abf/framework/base.dart';

Widget buildView(
    TravelDetailsState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    key: state.key,
    appBar: DefaultToolBar(
      title: '我的旅行详情',
      rightWidget: Padding(
        padding: EdgeInsets.only(top: kToolbarHeight / 3, right: 12),
        child: GestureDetector(
          onTap: () {
            dispatch(TravelDetailsActionCreator.onSaveAction());
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
                _renderText('护照签发国家/地区', '(必填)'),
                DefaultItemContainer(
                  onClick: () {
                    dispatch(
                        TravelDetailsActionCreator.onSelectCountryAction());
                  },
                  title: state.confirmCountry,
                  rightWidget: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                ),
                _renderText('护照号码', '(必填)'),
                _renderInput('请输入护照号码', (text) {
                  dispatch(
                      TravelDetailsActionCreator.onChangeNumberAction(text));
                }, state.number),
                _renderText('您是澳大利亚居民码？', '(必填)'),
                Row(
                  children: <Widget>[
                    Checkbox(
                        value: state.isAsPerson,
                        onChanged: (isCheck) {
                          dispatch(TravelDetailsActionCreator
                              .onChangeIsAsSelectAction());
                        }),
                    Text(state.isAsPerson ? '是' : '否')
                  ],
                ),
                state.isAsPerson
                    ? Padding(
                        padding: EdgeInsets.only(top: 12, bottom: 12),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.error,
                              size: 42,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Text(
                                  '如果您的商品......',
                                  maxLines: 3,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(
                        width: 0,
                        height: 0,
                      ),
                _renderText('离开日期', '(必填)'),
                DefaultItemContainer(
                  titleColor: defaultBlackTextColor,
                  backgroundColor: Colors.white,
                  title: state.confirmDate,
                  rightWidget: GestureDetector(
                    child: Icon(Icons.date_range),
                    onTap: () {
                      dispatch(TravelDetailsActionCreator.onSelectDateAction());
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

_renderInput(String hint, Function textChange, initText, {Widget rightWidget}) {
  return RadiusContainer(
    childWidget: Stack(
      children: <Widget>[
        TextField(
          keyboardType: TextInputType.number,
          controller: TextEditingController.fromValue(TextEditingValue(
              text: initText,
              selection: TextSelection.fromPosition(TextPosition(
                  affinity: TextAffinity.downstream,
                  offset: initText.length)))),
          onChanged: (text) {
            textChange(text);
          },
          style: TextStyle(fontSize: 12),
          maxLines: 1,
          decoration: new InputDecoration(
              hintStyle: TextStyle(fontSize: 12, color: hintTextColor),
              hintText: hint,
              border: InputBorder.none),
        ),
        Positioned(
          child: rightWidget == null ? Container() : rightWidget,
          right: 6,
          top: 8,
        )
      ],
    ),
  );
}

_renderText(String s, String t) {
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

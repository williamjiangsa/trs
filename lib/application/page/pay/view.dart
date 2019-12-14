import 'package:extended_text/extended_text.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:trs_abf/application/common/common_widget.dart';
import 'package:trs_abf/framework/base.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    PayDetailState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    key: state.key,
    appBar: DefaultToolBar(
      title: '我的付款详情',
      rightWidget: Padding(
        padding: EdgeInsets.only(top: kToolbarHeight / 3, right: 12),
        child: GestureDetector(
          onTap: () {
            dispatch(PayDetailActionCreator.onSaveAction());
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
        slivers: _renderView(state, dispatch, viewService),
      ),
    ),
  );
}

List<Widget> _renderView(
    PayDetailState state, Dispatch dispatch, ViewService viewService) {
  List<Widget> mWidget = List();
  mWidget.add(
    SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          _renderText('如果申请获批，您会选择哪种退税方式', '(必填)'),
          _renderItem('信用卡', state.checkXyk, () {
            dispatch(PayDetailActionCreator.onChangeCheckXykAction());
          }),
          _renderItem('澳大利亚银行账户', state.checkAsAccount, () {
            dispatch(PayDetailActionCreator.onChangeCheckAsAccountAction());
          }),
          _renderItem('支票', state.checkAsZp, () {
            dispatch(PayDetailActionCreator.onChangeCheckZpAction());
          }),
        ],
      ),
    ),
  );

  if (state.checkAsZp) {
    mWidget.add(SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          Padding(
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
                      '如果您的商品.......',
                      maxLines: 3,
                    ),
                  ),
                ),
                _renderText('退税币种', '(必填)'),
              ],
            ),
          ),
          DefaultItemContainer(
            onClick: () {
              dispatch(PayDetailActionCreator.onSelectCurrencyAction());
            },
            title: state.currency,
            rightWidget: GestureDetector(
              child: Icon(Icons.arrow_drop_down),
              onTap: () {
                dispatch(PayDetailActionCreator.onSelectCurrencyAction());
              },
            ),
          ),
          _renderText('姓', '(必填)'),
        ],
      ),
    ));
    mWidget.add(SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          _renderInput('请输入您的姓氏', (text) {
            dispatch(PayDetailActionCreator.onChangeLastNameAction(text));
          }, state.lastName),
          _renderText('名', '(必填)'),
        ],
      ),
    ));
    mWidget.add(SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          _renderInput('请输入您的名', (text) {
            dispatch(PayDetailActionCreator.onChangeNameAction(text));
          }, state.name),
          _renderText('国家', '(必填)'),
          DefaultItemContainer(
            onClick: () {
              dispatch(PayDetailActionCreator.onSelectCountryAction());
            },
            title: state.country,
            rightWidget: GestureDetector(
              child: Icon(Icons.arrow_drop_down),
              onTap: () {
                dispatch(PayDetailActionCreator.onSelectCountryAction());
              },
            ),
          ),
          _renderText('地址第一行', '(必填)'),
        ],
      ),
    ));
    mWidget.add(SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          _renderInput('请输入您的地址', (text) {
            dispatch(PayDetailActionCreator.onChangeAddressLineOneAction(text));
          }, state.addressLineOne),
          _renderText('地址第二行', ''),
        ],
      ),
    ));
    mWidget.add(SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          _renderInput('请输入您的地址', (text) {
            dispatch(PayDetailActionCreator.onChangeAddressLineTwoAction(text));
          }, state.addressLineTwo),
          _renderText('城市', '(必填)'),
        ],
      ),
    ));
    mWidget.add(SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          _renderInput('请输入您的城市', (text) {
            dispatch(PayDetailActionCreator.onChangeCityAction(text));
          }, state.city),
          _renderText('州/省', ''),
        ],
      ),
    ));
    mWidget.add(SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          _renderInput('请输入您的州/省', (text) {
            dispatch(PayDetailActionCreator.onChangeProAction(text));
          }, state.pro),
          _renderText('邮政编码', ''),
        ],
      ),
    ));
    mWidget.add(SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          _renderInput('请输入您的邮编', (text) {
            dispatch(PayDetailActionCreator.onChangeZipCodeAction(text));
          }, state.zipCode),
        ],
      ),
    ));
  } else if (state.checkXyk) {
    mWidget.add(SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(12),
        child: ExtendedText(
            '有效的信用卡包括：\n\n● 美国运通卡\n● 大来卡\n● JCB卡\n● 万事达卡\n● 中国银联信用卡\n\n\n出于安全保障，您的信用卡将被TRS办理台被扫描。请确保您准备好信用卡及其他文件'),
      ),
    ));
  } else if (state.checkAsAccount) {
    mWidget.add(SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          _renderText('账户名', '(必填)'),
          _renderInput('请输入您的账户名', (text) {
            dispatch(PayDetailActionCreator.onChangeAccountNameAction(text));
          }, state.accountName),
          _renderText('BSB号码（6位数）', '(必填)'),
        ],
      ),
    ));
    mWidget.add(SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          _renderInput('请输入您的BSB号码', (text) {
            dispatch(PayDetailActionCreator.onChangeBsbNumberAction(text));
          }, state.bsbNumber),
          _renderText('账号', '(必填)'),
        ],
      ),
    ));
    mWidget.add(SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          _renderInput('请输入您的账号', (text) {
            dispatch(PayDetailActionCreator.onChangeAccountAction(text));
          }, state.account),
        ],
      ),
    ));
  } else {
    mWidget.add(SliverToBoxAdapter(
      child: Container(
        width: 0,
        height: 0,
      ),
    ));
  }
  return mWidget;
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

_renderInput(String hint, Function change, String initText,
    {Widget rightWidget}) {
  if (initText == null) {
    initText = '';
  }
  return RadiusContainer(
    childWidget: Stack(
      children: <Widget>[
        TextField(
          controller: TextEditingController.fromValue(TextEditingValue(
              text: initText,
              selection: TextSelection.fromPosition(TextPosition(
                  affinity: TextAffinity.downstream,
                  offset: initText.length)))),
          onChanged: (text) {
            change(text);
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

_renderItem(text, isCheck, checkFunction) {
  return DefaultItemContainer(
    margin: EdgeInsets.only(top: 6, left: 6, right: 6),
    padding: EdgeInsets.all(0),
    child: Padding(
        padding: EdgeInsets.only(left: 12),
        child: Row(
          children: <Widget>[
            Checkbox(
                value: isCheck,
                onChanged: (isCheck) {
                  checkFunction();
                }),
            Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        )),
  );
}

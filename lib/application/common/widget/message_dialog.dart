/*
 * 项目名:    cacart_flutter
 * 包名
 * 文件名:    message_dialog
 * 创建时间:  2019/2/18 on 7:15 PM
 * 描述:     TODO
 *
 * @author   YHF
 */

import 'package:flutter/material.dart';
import 'package:trs_abf/framework/base.dart';

// ignore: must_be_immutable
class MessageDialog extends Dialog {
  String title;
  String message;
  String negativeText;
  String positiveText;
  bool showClose;
  Function onCloseEvent;
  Function onPositivePressEvent;

  MessageDialog({
    Key key,
    @required this.title,
    @required this.message,
    this.negativeText,
    this.positiveText,
    this.onPositivePressEvent,
    this.showClose = true,
    @required this.onCloseEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(15.0),
      child: new Material(
        type: MaterialType.transparency,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: ShapeDecoration(
                color: Color(0xffffffff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              margin: const EdgeInsets.all(12.0),
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: <Widget>[
                        new Center(
                          child: new Text(
                            title,
                            style: new TextStyle(
                              fontSize: 16,
                              color:  defaultBlackTextColor,
                            ),
                          ),
                        ),
                        _renderCloseButton(context),
                      ],
                    ),
                  ),
                  new Container(
                    color: Color(0xffe0e0e0),
                    height: 1.0,
                  ),
                  new Container(
                    alignment: Alignment.center,
                    constraints: BoxConstraints(minHeight: 90.0),
                    child: new Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: new IntrinsicHeight(
                        child: new Text(
                          message,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  new Container(
                    color: Color(0xffe0e0e0),
                    height: 1.0,
                  ),
                  this._buildBottomButtonGroup(context,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderCloseButton(BuildContext context){
    if(showClose){
      return GestureDetector(
        onTap: () {
          Navigator.of(context).maybePop();
        },
        child: new Padding(
          padding: const EdgeInsets.all(5.0),
          child: new Icon(
            Icons.close,
            color: Color(0xffe0e0e0),
          ),
        ),
      );
    }
    else{
      return Container();
    }
  }

  Widget _buildBottomButtonGroup(BuildContext context,) {
    var widgets = <Widget>[];
    if (negativeText != null && negativeText.isNotEmpty)
      widgets.add(_buildBottomCancelButton(context,));
    if (positiveText != null && positiveText.isNotEmpty)
      widgets.add(_buildBottomPositiveButton(context,));
    return new Flex(
      direction: Axis.horizontal,
      children: widgets,
    );
  }

  Widget _buildBottomCancelButton(BuildContext context,) {
    return new Flexible(
      fit: FlexFit.tight,
      child: new FlatButton(
        onPressed: onCloseEvent,
        child: new Text(
          negativeText,
          style: TextStyle(
            fontSize: 16,
            color: hintTextColor
          ),
        ),
      ),
    );
  }

  Widget _buildBottomPositiveButton(BuildContext context,) {
    return new Flexible(
      fit: FlexFit.tight,
      child: new FlatButton(
        onPressed: onPositivePressEvent,
        child: new Text(
          positiveText,
          style: TextStyle(
            color:defaultBlackTextColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

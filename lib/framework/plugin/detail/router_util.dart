
/**
 *
 * Copyright 2019 杭州链群信息科技有限公司   版权所有
 * Copyright 2019 LianQun Group Holding Ltd. All Rights Reserved
 *
 * Created by YHF on 2019/1/22.
 * 路由表  提供参照 不做封装使用
 */
import 'package:flutter/material.dart';
class RouterUtil {
  // 工厂模式
  factory RouterUtil() => _getInstance();
  static RouterUtil get instance => _getInstance();
  static RouterUtil _instance;
  RouterUtil._internal() {
    // 初始化
  }
  static RouterUtil _getInstance() {
    if (_instance == null) {
      _instance = new RouterUtil._internal();
    }
    return _instance;
  }

  //静态路由
  Map<String, WidgetBuilder> getRouter() {
    return {
      //路由指定页面
      //aPage: (BuildContext context) => new MyApp(),
    };
  }

  //跳转页面 name:页面名称
  void pushName(BuildContext buildContext, String name) {
    Navigator.of(buildContext).pushNamed('/b');
  }

  //动态路由  传入widget组件
  void push(BuildContext buildContext, Widget widget) {
    Navigator.of(buildContext).push(new MaterialPageRoute(builder: (_) {
      return widget;
    }));
  }

  void pushWithData(BuildContext buildContext, Widget widget) {
    Navigator.push(buildContext,
        new MaterialPageRoute(builder: (BuildContext context) {
      return widget;
    })).then((Object result) {
      //跳转页面返回数据接收
    });
  }

  void pushAndReceive(BuildContext context,Widget widget, Function receive) {
    Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext context) {
          return widget;
        })).then(receive);
  }



  void pop(BuildContext buildContext) {
    Navigator.of(buildContext).pop();
  }

  void popWithData(BuildContext context,data) {
    Navigator.of(context).pop(data);
  }
}

import 'package:flutter/material.dart';
import 'package:trs_abf/framework/plugin/detail/share_preference_util.dart';

import 'application/page/main/page.dart';
import 'application/page/splashscreen.dart';
import 'application/page/terms/page.dart';
import 'application/common/db/db_helper.dart';

void main() async {
  await _initAsync();
  runApp(MyApp());
  initDb();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SplashScreen(
        title: Text('闪屏页面'),
        seconds: 2,
        navigateAfterSeconds: TermsPage().buildPage({}),
        backgroundColor: Colors.red,
      ),
    );
  }
//MainPage().buildPage({})
}

Future _initAsync() async {
  await SharedPreferencesUtil.getInstance();
}

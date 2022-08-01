import 'package:flutter/material.dart';
import 'package:flutter_app/pages/07.named_fritst_page.dart';
import 'package:flutter_app/pages/08.named_second_page.dart';

class NamedRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //home: MainRoute(),
      //注册路由表
      routes: {
        /// '/'是特殊地址，第一个页面
        "/" :(context) => NamedFirstPage(),
        "second": (context) => NamedSecondPage(),
      },
    );
  }
}

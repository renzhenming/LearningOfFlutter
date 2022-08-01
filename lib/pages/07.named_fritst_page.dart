import 'package:flutter/material.dart';
import 'package:flutter_app/pages/08.named_second_page.dart';
import 'package:flutter_app/pages/05.second_page.dart';

class NamedFirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("第一个命名路由页面"),
        ),
        body: Column(
          children: [
            Text("第一个命名路由页面"),
            Builder(builder: (context) {
              return RaisedButton(
                onPressed: () async {
                  //TODO 同时接收返回值
                  var result = await Navigator.pushNamed(context, "second");
                  debugPrint("$result");
                },
                child: Text("进入第二页"),
              );
            })
          ],
        ),
    );
  }
}

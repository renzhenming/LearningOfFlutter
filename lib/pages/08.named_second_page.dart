import 'package:flutter/material.dart';

/// Flutter ： Could not find a generator for route RouteSettings
/// 原因：是一个工程中多次使用MaterialApp ，也就是说，您应该只使用一个MaterialApp作为树的根。
/// 解决：需要删除子页面中MaterialApp，并将其改为Scaffold。
class NamedSecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("第二个命名路由页面"),
      ),
      body: Column(
        children: [
          const Text("第二个命名路由页面"),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context,"第二个命名路由页面退出了");
            },
            child: const Text("返回"),
          )
        ],
      ),
    );
  }
}

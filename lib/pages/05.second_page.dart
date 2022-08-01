import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("第二个页面"),
      ),
      body: Column(
        children: [
          const Text("我是第二个页面"),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context,"我是从secondpage 回来的");
            },
            child: const Text("返回"),
          )
        ],
      ),
    );
  }
}

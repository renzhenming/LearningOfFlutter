import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/pages/05.second_page.dart';

class AnimationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("自定义页面切换动画"),
        ),
        body: Column(
          children: [
            const Text("带动画切换效果的页面"),
            Builder(builder: (context) {
              return RaisedButton(
                onPressed: () async {
                  var result = await Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: const Duration(seconds: 1),
                          pageBuilder: (_, Animation<double> animation, __) {
                            return FadeTransition(
                              opacity: animation,
                              child: RotationTransition(
                                turns: Tween(begin: 0.5, end: 1.0)
                                    .animate(animation),
                                child: SecondPage(),
                              ),
                            );
                          }));
                  debugPrint("$result");
                },
                child: const Text("切换页面"),
              );
            })
          ],
        ),
      ),
    );
  }
}

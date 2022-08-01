import 'package:flutter/material.dart';
import 'package:flutter_app/pages/05.second_page.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "我是MaterialApp",
      home: Scaffold(
        appBar: AppBar(
          title: Text("第一个页面"),
        ),
        body: Column(
          children: [
            Text("我是第一个页面"),
            Builder(builder: (context) {
              return RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SecondPage();
                  }));
                },
                child: Text("进入第二页"),
              );
            })
          ],
        ),
      ),
    );
  }

//TODO 在创建`Navigator`的时候，会给一个**key**，这个key可以看成一个Widget的id。这里的**_navigator**就是我们指定的**navigatorKey**
// TODO(如果我们没指定，会给默认值的，所以不要疑惑不指定是不是就不创建`Navigator`了）。而通过这个key，就能够获得这个`Navigator`。直接获得了路由自然不需要再去查找了！
// final GlobalKey<NavigatorState> globalKey = GlobalKey();
// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//     navigatorKey: globalKey,
//     title: "我是MaterialApp",
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text("第一个页面"),
//       ),
//       body: Column(
//         children: [
//           Text("我是第一个页面"),
//           RaisedButton(
//             onPressed: () {
//               globalKey.currentState
//                   ?.push(MaterialPageRoute(builder: (context) {
//                 return SecondPage();
//               }));
//             },
//             child: Text("跳转第二个页面"),
//           )
//         ],
//       ),
//     ),
//   );
// }

//TODO 使用Builder嵌套,Builder的参数可以看成一个回调，
// TODO 接收自身的context并返回布局配置。现在路由是从Builder的父亲开始查找啦，自然能找到Navigator。
// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//     title: "我是MaterialApp",
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text("第一个页面"),
//       ),
//       body: Column(
//         children: [
//           Text("我是第一个页面"),
//           Builder(builder: (context) {
//             return RaisedButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) {
//                   return SecondPage();
//                 }));
//               },
//               child: Text("进入第二页"),
//             );
//           })
//         ],
//       ),
//     ),
//   );
// }

//TODO Navigator operation requested with a context that does not include a Navigator.
/**
 * 问题关键点在于**Navigator operation requested with a context that does not include a Navigator.**（导航操作请求使用了不包含Navigator的上下文context）

    `Navigator`实际上也是一个Widget，这个异常出现在`Navigator.of(context)`路由器的获取上，而这句代码会**从当前的context的父级一层层向上

    去查找一个`Navigator`**，我们当前传递的context就是MyApp，它的父级是root——UI根节点。`Navigator`这个widget的并不是由root创建的，因此在root下一级的上下文中无法获得`Navigator`。

    > 在之前所有的路由案例中，我们的上下文是MainRoute，它的父级是MaterialApp。MaterialApp内部就会创建一个Navigator。
    >
    > MaterialApp->\_MaterialAppState->WidgetsApp->\_WidgetsAppState
    >
    > ![Navigator的创建](图片\Navigator的创建.png)

    ​	所以问题就在于，`Navigator`需要通过MaterialApp或者它孩子的上下文。
 */
// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text("第一个页面"),
//       ),
//       body: RaisedButton(
//         onPressed: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context) {
//             return SecondPage();
//           }));
//         },
//         child: Text("跳转"),
//       ),
//     ),
//   );
// }
}

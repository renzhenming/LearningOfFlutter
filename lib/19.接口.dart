import 'dart:io';

void main() {
  var l = MyListener();
  l.onStart();
  l.onFinish();

  ///如果dart类实现了call函数，则可以当作方法来调用
  //调用call方法
  l("今天", "明天");
}

///dart中没有interface关键字，每个类都隐式的定义了一个包含所有成员的接口，并且这个类实现了这个接口
/////每个类都是接口
class Listener {
  void onStart() {}

  void onFinish() {}
}

///单继承，多实现
class MyListener implements Listener {
  @override
  void onFinish() {
    print('onFinish');
  }

  @override
  void onStart() {
    print('onStart');
  }

  ///如果dart类实现了call函数，则可以当作方法来调用
  void call(String a, String b) {
    "$a + $b";
    print('$a $b');
  }
}

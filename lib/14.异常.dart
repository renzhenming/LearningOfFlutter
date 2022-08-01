void main() {
  //和kotlin一样，不支持check exception,编译期异常不会强制要求捕获
  // method1();

  try {
    method1();
  } catch (e, a) {
    print(e.runtimeType);

    //第二个参数表示堆栈信息
    print(a);
  }

  //根据不同的异常类型来处理
  //on TYPE catch

  try {
    // method2();
    // method1();

    method3();
  } on Function catch (e, s) {
    print(e);
    e();
  } on Exception catch (e, s) {
    print(e);
  } on int catch (e, s) {
    print(e);
  } on String catch (e, s) {
    print(e);
  }
}

void method1() {
  // throw Exception("异常了");
  throw "你是水，我是火";
}

void method2() {
  // throw Exception("异常了");
  throw 100;
}

void test() {
  print("异常了，你别玩了");
}

///抛出一个方法
void method3() {
  // throw Exception("异常了");
  throw test;
}

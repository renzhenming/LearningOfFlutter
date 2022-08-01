import 'dart:io';

void main() {
  var c = C();
  c.a();
  c.b();
  c.c();
}

class A {
  /// 被混入(mixin)的类不能有构造函数，不然会编译不过
  // A();
  void a() {
    print('a()');
  }
}

class B {
  void b() {
    print('b()');
  }
}

///满足多继承的需要，可以使用AB类中的方法
///
/// 被混入(mixin)的类不能有构造函数，不然会编译不过
///
/// AB的顺序不同会有不同的效果，从右往左搜索
class C with A, B {
  void c() { ///C中定义了自己的方法
    print('c()');
  }

  void a(){
    //就像重写了一样，可以通过super调用父类方法
    super.a();
    print("c中的a方法执行");
  }

  ///dart不允许重载方法
  // void a(int a){
  //
  // }
}


///D中不需要定义自己的方法，就是一个简单的AB混合的效果，可以这样写。
class D = Object with A,B;
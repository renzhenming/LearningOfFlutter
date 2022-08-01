import 'package:flutter_app/point.dart';

void main() {
  var p = Point(12, 23);
  print(p.x);
  // print(p._y); //私有，无法访问

  var p2 = Point.XXX(23);
  print(p2.x);

  var map = {"x": 12, "y": 15};
  var p3 = Point.fromMap(map);
  print(p3.x);

  //使用new创建常量构造方法的对象，和普通对象没有区别
  //但是使用const创建对象，传递的参数也一样，这几个对象是同一个编译期常量（必定义有常量构造函数）
  var im = const ImmutableClass(121, 132);
  var im2 = const ImmutableClass(121, 132);
  print(im == im2);
  print(im.hashCode == im2.hashCode);



  //工厂构造方法
  var single = SingleTon.getInstance();
  var single2 = SingleTon.getInstance();

  print(single == single2);
  print(single.hashCode == single2.hashCode);
  single.myPrint("我是一个单例");

}



















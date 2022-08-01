class Point {
  int x = 2;

  //加下划线表示私有属性
  int _y = 1;

  Point(this.x, this._y);

  //命名构造方法，更能直观的表现出这个构造方法的特性
  Point.XXX(this.x);

  //参数初始化列表
  //命名构造方法
  Point.fromMap(Map<String, int> map)
      : x = map['x'] ?? 1,
        _y = map['y'] ?? 2; //可以不写方法题

  Point.fromMap2(Map map)
      : x = map['x'],
        _y = map['y'] {} //方法体

  //重定向构造方法，只能调用构造方法，不能调用命名构造方法
  Point.fromMap3(int x, int y) : this(x, y);
}

class SingleTon {
  static SingleTon? _instance;

  SingleTon._newInstance();

  ///工厂构造方法实现单例
  factory SingleTon.getInstance() {
    _instance ??= SingleTon._newInstance();
    return _instance!;
  }

  void myPrint(String ars){
    print(ars);
  }
}

class ImmutableClass {
  final int x;
  final int y;

  //常量构造函数，参数必须都是常量，final类型，不能有非final
  const ImmutableClass(this.x, this.y);
}

class Test{

  Test();

  Test.name();

}

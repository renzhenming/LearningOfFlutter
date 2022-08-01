void main() {
  method1(12, 13);
  method2();

  //不用带key
  method2(111,222);

  //必须带上key:
  method3(age: 14, sex: 45);
}

void method1(int i, int j) {
  print("$i, $j");
}

//可选位置参数
void method2([int i = 0, int j = 1]) {
  print("$i, $j");
}

//可选命名参数
void method3({int age = 14, int sex = 12}) {
  print("$age, $sex");
}

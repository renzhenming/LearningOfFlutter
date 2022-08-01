void main(){
  final i = 10; //运行期常量
  const j = 20; //编译期常量，

  //j = i; //const不能用final类型赋值，因为编译期更早，final是运行时才确定值的
  print(i);
  print(j);
}
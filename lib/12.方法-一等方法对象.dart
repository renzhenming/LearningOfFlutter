

void main(){
  Function f = fun;

  f((int i){
    return "1";
  });
}

//定义一个类型F,这个F其实就是一个方法，接收两个int返回void
typedef void F(int i,int j);

void fun2(Function f){
  f(1,2);
}

void fun3(void Function(int i,int j) f1){
  f1(1,2);
}

void fun(Function f){
  //方法都是对象，可以赋值给Function变量
  f(1);
}
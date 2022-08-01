import 'dart:io';

void main() {
  // Future f = Future.delayed(const Duration(seconds: 5));
  // f.then((value) {
  //   print(value);
  // });

  Future<int> f = File("/Users/renzhenming/MainActivity2.java").readAsString().then((value) {
    print(value);
    return 1;
  }).catchError((e,s){
    print('发生异常了 $e $s');
    return 2;
  });
  //then可以w完成有序任务的执行，
  f.then((value) => print(value)).whenComplete((){
    print('执行完成了');
  });

  //如果需要一组任务执行完成之后，再统一执行一个任务
  Future.wait([Future.delayed(const Duration(seconds: 2)),Future.delayed(const Duration(seconds: 3))]).then((value){
    print("两个任务都执行完了");
  });


  //一个一个的执行任务
  Future.forEach([1,2,3,4], (element) => print(element));
}


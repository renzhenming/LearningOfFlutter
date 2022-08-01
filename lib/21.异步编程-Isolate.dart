
import 'dart:io';
import 'dart:isolate';
int a = 10;

///isolate是Dart对actor并发模式的实现。运行中的Dart程序由一个或多个actor组成，
///这些actor也就是Dart概念里面的isolate。isolate是有自己的内存和单线程控制的运行实体。
///isolate本身的意思是“隔离”，因为isolate之间的内存在逻辑上是隔离的。
///isolate中的代码是按顺序执行的，任何Dart程序的并发都是运行多个isolate的结果。
///因为Dart没有共享内存的并发，没有竞争的可能性所以不需要锁，也就不用担心死锁的问题。

void main() {
  print('main');
  Isolate.spawn(method, "哈喽");

  ///内存不共享，所以在method中修改了a之后，这里的a还是原值
  print("main2 i = $a");


  ReceivePort receivePort = ReceivePort("receiver1");
  Isolate.spawn(method2, receivePort.sendPort);

  receivePort.listen((message) {
    print('接收到的message = $message');
    if(message is SendPort){
      message.send("外部发送消息给内部==我收到了");
      receivePort.close();
    }
  });
}

///线程间通信
void method2(SendPort sendPort){
  print('method2 enter');
  sendPort.send("哈哈");
  sendPort.send("baibai");

  ReceivePort innerRece = ReceivePort("innerRece");
  innerRece.listen((message) {
    print(message);
    innerRece.close();
  });
  var send = innerRece.sendPort;
  sendPort.send(send);
  print('method2 exit');
}

void method(var message){
  print('method enter');
  a = 20;
  print('a = $a');
  sleep(const Duration(seconds:3));
  print('method exit, a = $a');
}

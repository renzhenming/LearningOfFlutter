

import 'dart:io';
import 'dart:isolate';


///dart是单线程模型
///执行优先级 main>微任务队列>事件队列
///
/// dart也是事件驱动，dart中有两个队列，一个是微任务队列，一个是事件队列
///
/// dart在执行main函数之后，就会由loop开始执行两个队列的Event，会先执行微任务队列，再执行事件队列，事件队列
///
/// 执行过程中又回不断的检查微任务队列，如果有新的微任务，会插队执行
void main() {
  print("main enter");
  
  ReceivePort receivePort = ReceivePort("1==1");
  receivePort.listen((message) {
    print(message);
  });

  //异步方法
  Isolate.spawn((message) {
    sleep(Duration(seconds: 1));
    print(message);
  }, "我是isolate中的消息");
  Future.microtask(() {
    print("微任务执行1");
  });
  receivePort.sendPort.send("发送消息给消息接收器1");
  Future.microtask(() {
    print("微任务执行2");
  });
  receivePort.sendPort.send("发送消息给消息接收器2");
  Future.microtask(() {
    print("微任务执行3");
  });
  receivePort.sendPort.send("发送消息给消息接收器3");

  sleep(Duration(seconds: 5));

  print("main exit");
}


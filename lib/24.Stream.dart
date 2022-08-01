
import 'dart:io';

void main() {
  ///future是一次性读入内存，适合小文件
  var f = File("/Users/renzhenming/Android/面试/\[原版\]Android核心知识点笔记V2020.03.30.pdf").readAsBytes();
  f.then((value) {
  // print(value);
  });


  print('============================================================================================================================================================');

  ///stream是多次读取，适合大文件
  var stream =File("/Users/renzhenming/Android/面试/\[原版\]Android核心知识点笔记V2020.03.30.pdf").openRead();
  var listen = stream.listen((event) {
    print(event);
  });

  listen.onDone(() {
    print('onDone');
  });

  sleep(Duration(seconds: 2));
  print('pause');
  listen.pause();
  sleep(Duration(seconds: 1));
  print('resume');
  sleep(Duration(seconds: 1));
  listen.resume();

  ///拷贝文件 方式一
  // var fileStream = File("/Users/renzhenming/Android/面试/\[原版\]Android核心知识点笔记V2020.03.30.pdf").openRead();
  // var dstFile = File("/Users/renzhenming/Android/面试/\[原版\]Android核心知识点笔记V2020.03.30_copy.pdf").openWrite();
  // dstFile.addStream(fileStream);

  ///拷贝文件 方式二
  var strean2 = File("/Users/renzhenming/Android/面试/\[原版\]Android核心知识点笔记V2020.03.30.pdf").openRead();
  var dstFile2 = File("/Users/renzhenming/Android/面试/\[原版\]Android核心知识点笔记V2020.03.30_______.pdf").openWrite();
  strean2.listen((event) {
    dstFile2.add(event);
  });


  print('============================================================================================================================================================');
  var strean3 = File("/Users/renzhenming/Android/面试/\[原版\]Android核心知识点笔记V2020.03.30.pdf").openRead();
  // strean3.listen((event) {  ///这里会和广告订阅冲突，使用广播订阅的时候，不能设置这个listen
  //   print("event1");
  // });
  //订阅两次会报错，
  // strean3.listen((event) {
  //   print("event2");
  // });

  ///通过广播的方式可以多订阅
  var bStream = strean3.asBroadcastStream();
  bStream.listen((event) {
    print("event BroadcastStream1");
  });

  bStream.listen((event) {
    print("event BroadcastStream2");
  });
  bStream.listen((event) {
    print("event BroadcastStream3");
  });
}

void onError(){
  print('onError');
}


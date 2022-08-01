
import 'dart:io';
import 'dart:typed_data';

void main(){
  print('main 1');
  ///async和await有点像kotlin的协程，可以实现同步代码写出异步代码的效果
  var str = readFile();
  print('main 2');
}

///顺序读取两个文件
Future<String> readFile() async{
  print('readFile 1');
  sleep(Duration(seconds: 1));
  print('readFile 2');

  //await等待执行完成再执行后续代码
  String stream1 = await File("/Users/renzhenming/MainActivity.java").readAsString();
  sleep(Duration(seconds: 1));
  String stream2 = await File("/Users/renzhenming/MainActivity.java").readAsString();
  print('readFile 3');
  return stream2;
}
import 'dart:async';
import 'dart:io';

void main(){

  var stream = File("/Users/renzhenming/Android/面试/\[原版\]Android核心知识点笔记V2020.03.30.pdf").openRead();

  var broadStream = stream.asBroadcastStream();
  broadStream.listen((event) {
    print('broadStream.listen');
  });

  var controller = StreamController.broadcast();
  controller.add(12);
  controller.stream.listen((event) {
    print('controller.stream.listen');
  });

  broadStream.listen((event) {
    print('broadStream.listen 2');
  });




}
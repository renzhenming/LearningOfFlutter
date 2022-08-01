
void main() {
  var d = MyDownload();
  d.myPrint();
}

abstract class Download{
  String name = "";
  void myPrint();
}

class MyDownload extends Download{
  @override
  void myPrint() {
    print('print');
  }
}
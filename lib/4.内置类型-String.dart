void main() {
  String s = "i am a man";
  String s2 = 'i am a man';
  String s4 = 'a beautiful woman';
  //字符串格式化
  String s3 = "$s ,i am looking for a woman,${s4}";

  print(s3);


  ///多行字符串的声明
  String s5 = """
   中国
   福建
   威海
   三生石
  """;
  
  print(s5);
}

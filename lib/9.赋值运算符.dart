void main(){
  String? k = "12";

  if("12" == k){
    k = null;
  }
  //??=表示安全赋值，如果k不为空，后边不执行，如果为空，则赋值
  k??="我是默认值";

  print(k);

  k = null;

  String temp = k??"k是空，取个默认值给他";
  print(temp);
}
void main(){
  num j = 1;
  int i = j as int;
  print(i);

  if(i is int){
    print("i 是int类型");
  }else{
    print("i不是int类型");
  }

  String k = "100";
  if(k is! int){
    print("k不是int");
  }
}
void main(){
  List<int> list = [1,2,3,4,5];
  for (var value in list) {
    print(value);
  }

  for(var i = 0; i < list.length;i++){
    print(list[i]);
  }

  print("----------------------");

  //const 修饰这个对象，对象就不再可变，不能add
  List<int> list2 = const[11,12,123];
  //Unsupported operation: Cannot add to an unmodifiable list
  //list2.add(12); //不可以修改
  list2 = [22,33,44]; //可以重新指向
  print(list2); //

  //const 修饰引用，那么就不能再指向其他对象
  const List<int> list3 = [4,5,6];
  // list3 = [6,7,8]; //不可以重新指向
  // list3.add(7); //也不可以修改//Unsupported operation: Cannot add to an unmodifiable list
  print(list3);

}
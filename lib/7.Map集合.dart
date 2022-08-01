void main() {

  //const修饰和List是一样的
  Map<int, int> map = {1: 1, 2: 2, 3: 3};
  print(map[1]);
  print(map[2]);
  print(map[3]);

  map.forEach((key, value) {
    print('key= $key, value = $value');
  });

  //增加元素
  map[4] = 4;
  print(map);

  var keys = map.keys;
  print('keys = $keys');
}

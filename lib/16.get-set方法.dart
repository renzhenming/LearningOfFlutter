void main(){
  var r = Range();
  r.anotherZ = 300;
  print(r.anotherZ);
}


class Range{

  //每一个属性都有隐式的get set方法，和kotlin一样
  int x = 0;
  int y = 0;
  int _z = 0;


  int get anotherZ => _z;

  set anotherZ(int z) {
    this._z = z;
  }
}
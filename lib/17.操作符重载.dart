import 'dart:math';

void main() {
  var p = Point(12, 13);
  var p2 = Point(33, 34);
  var p3 = p + p2;
  print(p3.x);
  print(p3.y);

  var p4 = p - p2;
  print(p4);

  var p5 = p * p2.x;
  print(p5);
}

class Point {
  int x = 0;
  int y = 0;

  Point(this.x, this.y);

  Point operator +(Point p) {
    return Point(x + p.x, y + p.y);
  }

  ///参数和返回值，并不要求必须是Point
  int operator -(Point p) {
    return x - p.x;
  }

  int operator *(int x) {
    return this.x * x;
  }
}

void main(){



  ///dart中的int,可以当作java中的short int long使用，如果超过了4个字节，那么dart会将它编译成java中的long
  ///否则编译成java中的int或者short
  int i = 10; //int 也是一个类，继承自num
  print(i.bitLength);//二进制的位数

  int i2 = 2;
  print(i2.bitLength);
}
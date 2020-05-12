import 'dart:io';

void main() {
  // wide
  // long
  print('====คำนวณพื้นที่ของสี่เหลี่ยม====');

  stdout.writeln('ระบุ ความยาว: ?');
  String long = stdin.readLineSync();

  stdout.writeln('ระบุ ความกว้าง: ? (สี่เหลี่ยม จตุรัส ไม่ต้องระบุ)');
  String wide = stdin.readLineSync();
  print('พื้นที่ ${areaCalculate(long: long, wide: wide)}' );
}

int areaCalculate({String long, String wide}) {
  if (tonum(wide) != 0) {
    return tonum(wide) * tonum(long);
  }else{
    return tonum(long) * tonum(long);
  }
}

int tonum(String strNum)=> strNum.length > 0? int.parse(strNum) : 0;


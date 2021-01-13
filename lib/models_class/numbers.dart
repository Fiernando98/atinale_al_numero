import 'package:flutter/cupertino.dart';

enum TypeNumber { Maya, Arabigo }

class Numbers {
  final int num;
  final TypeNumber type;

  Numbers({@required this.num, @required this.type});

  @override
  String toString() {
    return '\nNumbers{num: $num, type: ${type.toString().split(".").last}}';
  }
}

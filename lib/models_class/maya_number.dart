import 'package:flutter/cupertino.dart';

class MayaNumber {
  final List<int> x8000;
  final List<int> x400;
  final List<int> x20;
  final List<int> x;

  MayaNumber(
      {@required this.x8000,
      @required this.x400,
      @required this.x20,
      @required this.x});

  @override
  String toString() {
    return '\nMayaNumber{x8000: $x8000, x400: $x400, x20: $x20, x: $x}';
  }
}

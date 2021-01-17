import 'package:flutter/cupertino.dart';

class Difficulty {
  final String name;
  final int numMin;
  final int numMax;

  Difficulty(
      {@required this.name, @required this.numMin, @required this.numMax});

  @override
  String toString() {
    return '\nDifficulty{name: $name, numMin: $numMin, numMax: $numMax,}';
  }
}

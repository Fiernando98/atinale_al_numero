import 'package:flutter/cupertino.dart';

class Difficulty {
  final String name;
  final int numMax;
  final int numMin;

  Difficulty(
      {@required this.name, @required this.numMax, @required this.numMin});

  @override
  String toString() {
    return '\nDifficulty{name: $name, numMax: $numMax, numMin: $numMin}';
  }
}

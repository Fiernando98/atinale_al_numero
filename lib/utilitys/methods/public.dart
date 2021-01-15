import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numeracion_maya/models_class/maya_number.dart';

void snackMessage(
    {@required String message,
    @required GlobalKey<ScaffoldState> scaffoldKey}) {
  SnackBar snackBar = SnackBar(
      duration: Duration(seconds: 2),
      backgroundColor: Colors.teal[800],
      content: Text(
        message,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ));
  ScaffoldMessenger.of(scaffoldKey.currentContext).showSnackBar(snackBar);
}

void snackErrorMessage(
    {@required String message,
    @required GlobalKey<ScaffoldState> scaffoldKey}) {
  SnackBar snackBar = SnackBar(
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red[700],
      content: Text(
        message,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ));
  ScaffoldMessenger.of(scaffoldKey.currentContext).showSnackBar(snackBar);
}

MayaNumber getMayaNumber({@required int num}) {
  List<int> x20 = [];
  List<int> x = [];

  int _numCalc = num;
  if (_numCalc ~/ (5 * 20) >= 1) {
    for (int i = 0; i < _numCalc ~/ (5 * 20).toInt(); i++) {
      x20.add(5);
    }
    _numCalc = _numCalc % (5 * 20);
  }
  if (_numCalc ~/ (1 * 20) >= 1) {
    for (int i = 0; i < _numCalc ~/ (1 * 20); i++) {
      x20.add(1);
    }
    _numCalc = _numCalc % (1 * 20);
  }

  if (_numCalc ~/ (5) >= 1) {
    for (int i = 0; i < _numCalc ~/ (5); i++) {
      x.add(5);
    }
    _numCalc = _numCalc % (5);
  }
  if (_numCalc ~/ (1) >= 1) {
    for (int i = 0; i < _numCalc ~/ (1); i++) {
      x.add(1);
    }
    _numCalc = _numCalc % (1);
  }
  if (x.isEmpty) x.add(0);
  return MayaNumber(x20: x20, x: x);
}

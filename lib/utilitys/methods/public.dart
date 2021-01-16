import 'dart:math';

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

void snackErrorMessage({@required String message,
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

MayaNumber convertirMaya({int num}) {
  List<int> x8000 = [];
  List<int> x400 = [];
  List<int> x20 = [];
  List<int> x = [];

  int _numCalc = num;

  if (_numCalc ~/ (5 * 400) >= 1) {
    for (int i = 0; i < _numCalc ~/ (5 * 400).toInt(); i++) {
      x400.add(5);
    }
    _numCalc = _numCalc % (5 * 400);
  }
  if (_numCalc ~/ (1 * 400) >= 1) {
    for (int i = 0; i < _numCalc ~/ (1 * 400); i++) {
      x400.add(1);
    }
    _numCalc = _numCalc % (1 * 400);
  }

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

  if (x400.isEmpty && x8000.isNotEmpty) x400.add(0);
  if (x20.isEmpty && x400.isNotEmpty) x20.add(0);
  if (x.isEmpty) x.add(0);
  return MayaNumber(x8000: x8000, x400: x400, x20: x20, x: x);
}

List<List<int>> getMayaNumber({@required int num}) {
  List<int> xPows = [1];
  while (xPows.first < num) {
    xPows.insert(0, xPows.first * 20);
  }
  List<List<int>> listResults = [];
  int index = 0;
  xPows.forEach((multi) {
    List<int> results = [];
    [5, 1].forEach((value) {
      if (num ~/ (value * multi) >= 1) {
        for (int i = 0; i < num ~/ (value * multi); i++) {
          results.add(value);
        }
        num = num % (value * multi);
      }
    });
    if (results.isEmpty && index > 0 && listResults[index - 1].isNotEmpty)
      results.add(0);
    listResults.add(results);
    index++;
  });
  listResults.removeWhere((xList) => xList.isEmpty);
  return listResults;
}

int getArabigoNumber({@required List<List<int>> list}) {
  int num = 0;
  list.reversed.toList().forEach((xList) {
    xList.forEach((listNum) =>
        num += (listNum * pow(20, list.reversed.toList().indexOf(xList))));
  });
  return num;
}

MayaNumber getMayaValue({@required int num}) {
  List<List<int>> listResults = [];
  int index = 0;
  for (int multi in [8000, 400, 20, 1]) {
    List<int> results = [];
    for (int value in [5, 1]) {
      if (num ~/ (value * multi) >= 1) {
        for (int i = 0; i < num ~/ (value * multi).toInt(); i++) {
          results.add(value);
        }
        num = num % (value * multi);
      }
    }
    if (results.isEmpty && index > 0 && listResults[index - 1].isNotEmpty)
      results.add(0);
    listResults.add(results);
    index++;
  }
  return MayaNumber(
      x8000: listResults[0],
      x400: listResults[1],
      x20: listResults[2],
      x: listResults[3]);
}

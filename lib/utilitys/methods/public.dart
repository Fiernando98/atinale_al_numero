import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

List<List<int>> getMayaValue({@required int num}) {
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
  return listResults;
}

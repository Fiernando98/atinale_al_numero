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

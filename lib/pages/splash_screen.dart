import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numeracion_maya/pages/main_menu.dart';
import 'package:numeracion_maya/utilitys/languages.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isFirst = true;
  String _message = "";

  Widget _messageWidget() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        _message,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 17),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isFirst) {
      validateStart();
    }
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(strokeWidth: 5),
              ),
              _messageWidget()
            ],
          ),
        ),
      ),
    );
  }

  Future<void> validateStart() async {
    isFirst = false;
    setState(() {
      _message = getTranslation[getLanguage(context)]['Loading'];
    });
    Timer(Duration(seconds: 1), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MainMenu()),
          (Route<dynamic> route) => false);
    });
  }
}

import 'package:button3d/button3d.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numeracion_maya/utilitys/languages.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Button3d(
          width: 150,
          style: Button3dStyle(
              topColor: Colors.blue,
              backColor: Colors.blueAccent[400],
              z: 13,
              tappedZ: 5,
              borderRadius: BorderRadius.circular(25)),
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              getTranslation[getLanguage(context)]['Start'],
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}

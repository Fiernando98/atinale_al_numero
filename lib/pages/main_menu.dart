
import 'package:button3d/button3d.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numeracion_maya/pages/select%20difficulty.dart';
import 'package:numeracion_maya/utilitys/languages.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _count = 10;

  Widget _containerCountPlays() {
    return Container(
      width: 500,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).accentColor, width: 3),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          _buttonMinusCount(),
          Expanded(child: _textCount()),
          _buttonAddCount()
        ],
      ),
    );
  }

  Widget _buttonMinusCount() {
    return Button3d(
      width: 70,
      height: 70,
      style: Button3dStyle(
          topColor: Colors.deepOrange[400],
          backColor: Colors.deepOrange[800],
          z: 10,
          tappedZ: 5,
          borderRadius: BorderRadius.circular(30)),
      onPressed: () {
        if (_count > 1)
          setState(() {
            _count--;
          });
      },
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Icon(
          Icons.exposure_minus_1,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }

  Widget _textCount() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "$_count",
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
        ),
        Text(
          getTranslation[getLanguage(context)]['Plays'],
          style: TextStyle(fontStyle: FontStyle.italic),
        )
      ],
    );
  }

  Widget _buttonAddCount() {
    return Button3d(
      width: 70,
      height: 70,
      style: Button3dStyle(
          topColor: Colors.amber[600],
          backColor: Colors.amber[800],
          z: 10,
          tappedZ: 5,
          borderRadius: BorderRadius.circular(30)),
      onPressed: () {
        setState(() {
          _count++;
        });
      },
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Icon(
          Icons.exposure_plus_1,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }

  Widget _buttonStart() {
    return Container(
      margin: EdgeInsets.all(15),
      child: Button3d(
        width: 500,
        style: Button3dStyle(
            topColor: Colors.blueAccent[200],
            backColor: Colors.blueAccent[400],
            z: 10,
            tappedZ: 5,
            borderRadius: BorderRadius.circular(30)),
        onPressed: _generatePlays,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                getTranslation[getLanguage(context)]['Start'],
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 27,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_containerCountPlays(), _buttonStart()],
          ),
        ),
      ),
    );
  }

  void _generatePlays() {
    if (_count > 0) {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => SelectDifficulty(count: _count)),
      );
    }
  }
}

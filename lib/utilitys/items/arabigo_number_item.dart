import 'package:button3d/button3d.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArabigoNumberItem extends StatelessWidget {
  final int number;
  final Function onTap;

  ArabigoNumberItem({@required this.number, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Button3d(
      width: 60,
      height: 60,
      style: Button3dStyle(
          topColor: Colors.teal[500],
          backColor: Colors.teal[800],
          z: 10,
          tappedZ: 5,
          borderRadius: BorderRadius.circular(30)),
      onPressed: onTap,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "$number",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}

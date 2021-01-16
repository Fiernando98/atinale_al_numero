import 'package:button3d/button3d.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MayaNumberItem extends StatelessWidget {
  final int number;
  final Function onTap;

  MayaNumberItem({@required this.number, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    Widget _imageNumber() {
      switch (number) {
        case 0:
          return Image.asset("assets/cero_maya.png", color: Colors.white);
        case 1:
          return Image.asset("assets/uno_maya.png",
              height: 25, color: Colors.white);
        case 5:
          return Image.asset("assets/cinco_maya.png", color: Colors.white);
        default:
          return Image.asset("assets/cero_maya.png", color: Colors.white);
      }
    }

    return Button3d(
      width: 80,
      height: 80,
      style: Button3dStyle(
          topColor: Colors.teal[600],
          backColor: Colors.teal[800],
          z: 10,
          tappedZ: 5,
          borderRadius: BorderRadius.circular(30)),
      onPressed: onTap,
      child: Center(
        child: Padding(padding: EdgeInsets.all(15), child: _imageNumber()),
      ),
    );
  }
}

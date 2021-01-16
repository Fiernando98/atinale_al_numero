import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numeracion_maya/utilitys/languages.dart';

class BottomSheetResult extends StatelessWidget {
  final int answer;
  final int num;

  BottomSheetResult({@required this.answer, @required this.num});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: answer == num ? Colors.green[700] : Colors.red[500],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
              width: 70,
              height: 5,
              margin: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)))),
          Container(
            child: Text(
                answer == num
                    ? getTranslation[getLanguage(context)]['Correct']
                    : getTranslation[getLanguage(context)]['Incorrect'],
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 25)),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 15),
            child: Text("${answer != num ? "$answer / " : ""}${num}",
                style: TextStyle(color: Colors.white, fontSize: 40)),
          ),
        ]));
  }
}

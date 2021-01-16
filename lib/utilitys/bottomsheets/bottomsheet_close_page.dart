import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numeracion_maya/utilitys/languages.dart';

class BottomSheetClosePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.blueAccent[700],
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
            margin: EdgeInsets.only(bottom: 7),
            child: Text(
                getTranslation[getLanguage(context)]
                    ['DoYouWantToCloseThisPage'],
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 17)),
          ),
          Material(
              color: Colors.transparent,
              child: ListTile(
                  leading: Icon(Icons.close, color: Colors.white),
                  title: Text(getTranslation[getLanguage(context)]['Cancel'],
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.of(context).pop(false);
                  })),
          Material(
              color: Colors.transparent,
              child: ListTile(
                  leading: Icon(Icons.exit_to_app, color: Colors.white),
                  title: Text(getTranslation[getLanguage(context)]['Close'],
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.of(context).pop(true);
                  }))
        ]));
  }
}

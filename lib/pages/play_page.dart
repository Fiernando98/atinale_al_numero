import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numeracion_maya/models_class/numbers.dart';
import 'package:numeracion_maya/utilitys/items/arabigo_number.dart';
import 'package:numeracion_maya/utilitys/items/maya_number.dart';
import 'package:numeracion_maya/utilitys/providers/plays_providers.dart';
import 'package:provider/provider.dart';

class PlayPage extends StatefulWidget {
  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _arabigoNumbers() {
    return Wrap(
        spacing: 7,
        runSpacing: 7,
        children: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].map((number) {
          return ArabigoNumber(number: number, onTap: () {});
        }).toList());
  }

  Widget _mayaNumbers() {
    return Wrap(
        spacing: 15,
        runSpacing: 15,
        children: [0, 1, 5].map((number) {
          return MayaNumber(number: number, onTap: () {});
        }).toList());
  }

  Widget _numWidget() {
    if (context
            .watch<PlaysProvider>()
            .playsList[context.watch<PlaysProvider>().answersList.length]
            .type ==
        TypeNumber.Arabigo) {
      return _arabigoNumbers();
    } else {
      return _mayaNumbers();
    }
  }

  Widget _widgetNumber() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.all(20),
          child: Text(
            "${context.watch<PlaysProvider>().playsList[context.watch<PlaysProvider>().answersList.length].num}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 80),
          ),
        ),
        Divider(
          thickness: 2,
          color: Colors.grey,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [_widgetNumber(), _numWidget()],
          ),
        ),
      ),
    );
  }
}

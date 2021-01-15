import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numeracion_maya/models_class/maya_number.dart';
import 'package:numeracion_maya/models_class/numbers.dart';
import 'package:numeracion_maya/utilitys/items/arabigo_number_item.dart';
import 'package:numeracion_maya/utilitys/items/maya_number_item.dart';
import 'package:numeracion_maya/utilitys/methods/public.dart';
import 'package:numeracion_maya/utilitys/providers/plays_providers.dart';
import 'package:provider/provider.dart';

class PlayPage extends StatefulWidget {
  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<int> inputListNum = [];

  Widget _widgetNumber() {
    return Container(
      margin: EdgeInsets.all(25),
      child: context
                  .watch<PlaysProvider>()
                  .playsList[context.watch<PlaysProvider>().answersList.length]
                  .type ==
              TypeNumber.Arabigo
          ? _numberArabigo()
          : _numberMaya(),
    );
  }

  Widget _numberArabigo() {
    return Text(
      "${context.watch<PlaysProvider>().playsList[context.watch<PlaysProvider>().answersList.length].num}",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 80),
    );
  }

  Widget _numberMaya() {
    MayaNumber mayaNumber = getMayaNumber(
        num: context
            .watch<PlaysProvider>()
            .playsList[context.watch<PlaysProvider>().answersList.length]
            .num);
    print(mayaNumber.toString());
    List<Widget> widgetsList = [];
    if (mayaNumber.x20.isNotEmpty) {
      widgetsList.add(Divider(
        thickness: 1,
        color: Colors.grey,
      ));
    }
    if (mayaNumber.x.isNotEmpty) {
      widgetsList.add(Divider(
        thickness: 1,
        color: Colors.grey,
      ));
    }
    return Column(
      children: widgetsList,
    );
  }

  Widget _arabigoNumbers() {
    return Wrap(
        spacing: 7,
        runSpacing: 7,
        children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 0].map((number) {
          return ArabigoNumberItem(
              number: number,
              onTap: () {
                if (inputListNum.length < 10)
                  setState(() {
                    inputListNum.add(number);
                  });
              });
        }).toList());
  }

  Widget _mayaNumbers() {
    return Wrap(
        spacing: 15,
        runSpacing: 15,
        children: [0, 1, 5].map((number) {
          return MayaNumberItem(
              number: number,
              onTap: () {
                if (inputListNum.length < 10)
                  setState(() {
                    inputListNum.add(number);
                  });
              });
        }).toList());
  }

  Widget _numWidget() {
    if (context
            .watch<PlaysProvider>()
            .playsList[context.watch<PlaysProvider>().answersList.length]
            .type ==
        TypeNumber.Maya) {
      return _arabigoNumbers();
    } else {
      return _mayaNumbers();
    }
  }

  Widget _inputNumber() {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 3),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Expanded(
              child: Text(
            "${inputListNum.join()}",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                fontStyle: FontStyle.italic),
          )),
          IconButton(
              icon: Icon(Icons.backspace),
              iconSize: 30,
              onPressed: () {
                setState(() {
                  inputListNum.removeLast();
                });
              })
        ],
      ),
    );
  }

  Widget _bodyPlay() {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _widgetNumber(),
          Divider(
            thickness: 2,
            color: Colors.grey,
          ),
          _inputNumber(),
          _numWidget()
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _widgetNumber(),
          VerticalDivider(
            thickness: 2,
            color: Colors.grey,
          ),
          Expanded(
              child: Column(
            children: [_inputNumber(), _numWidget()],
          ))
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Center(
          child: _bodyPlay(),
        ),
      ),
    );
  }
}

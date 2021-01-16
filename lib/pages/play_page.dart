import 'package:button3d/button3d.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numeracion_maya/models_class/maya_number.dart';
import 'package:numeracion_maya/models_class/numbers.dart';
import 'package:numeracion_maya/utilitys/bottomsheets/bottomsheet_close_page.dart';
import 'package:numeracion_maya/utilitys/items/arabigo_number_item.dart';
import 'package:numeracion_maya/utilitys/items/maya_number_item.dart';
import 'package:numeracion_maya/utilitys/languages.dart';
import 'package:numeracion_maya/utilitys/methods/public.dart';
import 'package:numeracion_maya/utilitys/providers/plays_providers.dart';
import 'package:provider/provider.dart';

class PlayPage extends StatefulWidget {
  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<int> inputListNumArabigo = [];
  List<List<int>> inputListNumMaya = [];

  Widget _widgetNumber() {
    return Expanded(
        child: CustomScrollView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(
            margin: EdgeInsets.all(context
                        .watch<PlaysProvider>()
                        .playsList[
                            context.watch<PlaysProvider>().answersList.length]
                        .type ==
                    TypeNumber.Arabigo
                ? 25
                : 10),
            child: context
                        .watch<PlaysProvider>()
                        .playsList[
                            context.watch<PlaysProvider>().answersList.length]
                        .type ==
                    TypeNumber.Arabigo
                ? _numberArabigo()
                : _numberMaya(),
          ),
        )
      ],
    ));
  }

  Widget _numberArabigo() {
    return Center(
      child: Text(
        "${context.watch<PlaysProvider>().playsList[context.watch<PlaysProvider>().answersList.length].num}",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 80),
      ),
    );
  }

  Widget _numberMaya() {
    MayaNumber mayaNumber = getMayaValue(
        num: context
            .watch<PlaysProvider>()
            .playsList[context.watch<PlaysProvider>().answersList.length]
            .num);
    List<Widget> widgetsList = [];
    [mayaNumber.x8000, mayaNumber.x400, mayaNumber.x20, mayaNumber.x]
        .forEach((list) {
      if (list.isNotEmpty) {
        List<Widget> xList = [];
        if (list.contains(1)) {
          List<Widget> rowsList = [];
          list.where((element) => element == 1).toList().forEach((element) {
            rowsList.add(Container(
              margin: EdgeInsets.all(3),
              child: Image.asset("assets/uno_maya.png",
                  height: 15,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black),
            ));
          });
          xList.add(Container(
            margin: EdgeInsets.all(3),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: rowsList,
            ),
          ));
        }
        if (list.contains(5)) {
          list.where((element) => element == 5).toList().forEach((element) {
            xList.add(Container(
              margin: EdgeInsets.all(3),
              child: Image.asset("assets/cinco_maya.png",
                  height: 12,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black),
            ));
          });
        }
        if (list.contains(0)) {
          xList.add(Container(
            margin: EdgeInsets.all(3),
            child: Image.asset("assets/cero_maya.png",
                height: 25,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black),
          ));
        }
        widgetsList.add(Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 3),
              borderRadius: BorderRadius.circular(20)),
          child: Column(children: xList),
        ));
      }
    });
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widgetsList,
    );
  }

  Widget _arabigoNumbers() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Wrap(
          spacing: 7,
          runSpacing: 7,
          children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 0].map((number) {
            return ArabigoNumberItem(
                number: number,
                onTap: () {
                  if (inputListNumArabigo.length < 12)
                    setState(() {
                      inputListNumArabigo.add(number);
                    });
                });
          }).toList()),
    );
  }

  Widget _mayaNumbers() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Wrap(
            spacing: 15,
            runSpacing: 15,
            children: [0, 1, 5].map((number) {
              return MayaNumberItem(
                  number: number,
                  onTap: () {
                    if (inputListNumArabigo.length < 15)
                      setState(() {
                        inputListNumArabigo.add(number);
                      });
                  });
            }).toList()));
  }

  Widget _numWidget() {
    if (context
            .watch<PlaysProvider>()
            .playsList[context.watch<PlaysProvider>().answersList.length]
            .type ==
        TypeNumber.Maya) {
      return Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _inputNumberArabigo(),
              _arabigoNumbers(),
              _answerButton()
            ],
          ));
    } else {
      return Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_mayaNumbers()],
        ),
      );
    }
  }

  Widget _answerButton() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Button3d(
        width: 500,
        height: 80,
        style: Button3dStyle(
            topColor: Colors.blueAccent[200],
            backColor: Colors.blueAccent[400],
            z: 10,
            tappedZ: 5,
            borderRadius: BorderRadius.circular(30)),
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                getTranslation[getLanguage(context)]['Answer'],
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.check,
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

  Widget _inputNumberArabigo() {
    return Container(
      margin: EdgeInsets.only(top: 7, bottom: 15, right: 10, left: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 3),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Expanded(
              child: Text(
            "${inputListNumArabigo.join()}",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontStyle: FontStyle.italic),
          )),
          IconButton(
              icon: Icon(Icons.backspace),
              iconSize: 30,
              onPressed: () {
                setState(() {
                  inputListNumArabigo.removeLast();
                });
              })
        ],
      ),
    );
  }

  Widget _bodyPlay() {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return Column(
        children: [
          _widgetNumber(),
          Container(height: 2, color: Colors.grey),
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
            children: [_numWidget()],
          ))
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _dialogClosePage,
        child: SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
            body: Stack(
              children: [
                _bodyPlay(),
                IconButton(
                    icon: Icon(Icons.close),
                    onPressed: Navigator.of(context).maybePop)
              ],
            ),
          ),
        ));
  }

  Future<bool> _dialogClosePage() async {
    return await showModalBottomSheet<bool>(
            context: context,
            elevation: 50,
            backgroundColor: Colors.transparent,
            builder: (context) => BottomSheetClosePage()) ??
        false;
  }
}

import 'package:button3d/button3d.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  int indexMaya = 0;
  List<List<int>> inputListNumMaya = [[]];

  Widget _widgetNumber() {
    return Expanded(
        flex: 1,
        child: CustomScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                margin: EdgeInsets.all(
                    context.watch<PlaysProvider>().getCurrentPlay().type ==
                            TypeNumber.Arabigo
                        ? 20
                        : 10),
                child: context.watch<PlaysProvider>().getCurrentPlay().type ==
                        TypeNumber.Arabigo
                    ? _numberArabigo()
                    : _numberMaya(
                        mayaNumber: getMayaNumber(
                            num: context
                                .watch<PlaysProvider>()
                                .getCurrentPlay()
                                .num)),
              ),
            )
          ],
        ));
  }

  Widget _numberArabigo() {
    return Center(
      child: Text(
        "${context.watch<PlaysProvider>().getCurrentPlay().num}",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60),
      ),
    );
  }

  Widget _numberMaya({@required List<List<int>> mayaNumber}) {
    List<Widget> widgetsList = [];
    mayaNumber.forEach((list) {
      if (list.isEmpty) return Container();
      widgetsList.add(_rowNumberMaya(list: list));
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
                    if (number == 0 &&
                        (inputListNumMaya[indexMaya].contains(0) ||
                            inputListNumMaya[indexMaya].isNotEmpty)) return;
                    Map map = Map<int, int>();
                    if (number == 1) {
                      inputListNumMaya[indexMaya].forEach((x) =>
                          map[x] = !map.containsKey(x) ? (1) : (map[x] + 1));
                      if (map.containsKey(0) ||
                          map.containsKey(1) && map[1] == 4) return;
                    }
                    if (number == 5) {
                      inputListNumMaya[indexMaya].forEach((x) =>
                          map[x] = !map.containsKey(x) ? (1) : (map[x] + 1));
                      if (map.containsKey(0) ||
                          map.containsKey(5) && map[5] == 4) return;
                    }
                    setState(() {
                      inputListNumMaya[indexMaya].add(number);
                    });
                  });
            }).toList()));
  }

  Widget _numWidget() {
    if (context.watch<PlaysProvider>().getCurrentPlay().type ==
        TypeNumber.Maya) {
      return Expanded(
          flex: 1,
          child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: SingleChildScrollView(
                    child: _inputNumberArabigo(),
                  )),
                  _arabigoNumbers(),
                  _answerButton()
                ],
              )));
    } else {
      return Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  child: _inputNumberMaya(),
                )),
                _mayaNumbers(),
                _answerButton()
              ],
            ),
          ));
    }
  }

  Widget _answerButton() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Button3d(
        width: 500,
        height: 70,
        style: Button3dStyle(
            topColor: Colors.blueAccent[200],
            backColor: Colors.blueAccent[400],
            z: 10,
            tappedZ: 5,
            borderRadius: BorderRadius.circular(30)),
        onPressed: validateAnswer,
        child: Padding(
          padding: EdgeInsets.all(10),
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

  Widget _rowNumberMaya({@required List<int> list}) {
    if (list.isEmpty) return Container();
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
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 3),
          borderRadius: BorderRadius.circular(20)),
      child: Column(children: xList),
    );
  }

  Widget _inputNumberMaya() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: inputListNumMaya.map((xList) {
          return Row(
            children: [
              IconButton(
                  icon: Icon((inputListNumMaya.indexOf(xList) == indexMaya)
                      ? Icons.edit
                      : Icons.keyboard_arrow_right),
                  onPressed: () {
                    setState(() {
                      indexMaya = inputListNumMaya.indexOf(xList);
                    });
                  }),
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 3),
                    borderRadius: BorderRadius.circular(20)),
                child: _rowNumberMaya(list: xList),
              )),
              (inputListNumMaya.indexOf(xList) == indexMaya)
                  ? IconButton(
                      icon: Icon(Icons.backspace),
                      onPressed: () {
                        setState(() {
                          xList.removeLast();
                        });
                      })
                  : IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          inputListNumMaya.remove(xList);
                        });
                      })
            ],
          );
        }).toList()
          ..insert(
              0,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      if (inputListNumMaya.first.isNotEmpty) {
                        setState(() {
                          indexMaya = 0;
                          inputListNumMaya.insert(0, []);
                        });
                      }
                    },
                    iconSize: 30,
                  )
                ],
              )),
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
          Expanded(flex: 2, child: _numWidget())
        ],
      );
    }
  }

  Widget _scoreBody() {
    return Column(
      children: [
        Center(
          child: Text(
            getTranslation[getLanguage(context)]['Score'],
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
          ),
        ),
        Expanded(
            child: CustomScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: context
                    .watch<PlaysProvider>()
                    .playsList
                    .map((play) => Row(
                          children: [
                            Expanded(
                                child: Text(
                              "${play.type.toString().split(".").last} : ${play.num} [${getTranslation[getLanguage(context)]['YourAnswer']}: ${context.watch<PlaysProvider>().answersList[context.watch<PlaysProvider>().playsList.indexOf(play)]}]",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ))
                          ],
                        ))
                    .toList(),
              ),
            )
          ],
        )),
        _goBackButton()
      ],
    );
  }

  Widget _goBackButton() {
    return Container(
      margin: EdgeInsets.all(15),
      child: Button3d(
        width: 500,
        height: 70,
        style: Button3dStyle(
            topColor: Colors.green[500],
            backColor: Colors.green[800],
            z: 10,
            tappedZ: 5,
            borderRadius: BorderRadius.circular(30)),
        onPressed: _gameCompleted,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                getTranslation[getLanguage(context)]['GoBackToMenu'],
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _dialogClosePage,
        child: SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
            body: (context.watch<PlaysProvider>().getCurrentPlay()) != null
                ? Stack(
                    children: [
                      _bodyPlay(),
                      IconButton(
                          icon: Icon(Icons.close),
                          onPressed: Navigator.of(context).maybePop)
                    ],
                  )
                : _scoreBody(),
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

  void validateAnswer() async {
    if (inputListNumArabigo.isEmpty &&
        (inputListNumMaya.length == 1 && inputListNumMaya[0].isEmpty)) {
      snackErrorMessage(
          message: getTranslation[getLanguage(context)]['NumberCannotBeNull'],
          scaffoldKey: _scaffoldKey);
    } else {
      int answerNum;
      if (context.read<PlaysProvider>().getCurrentPlay().type ==
          TypeNumber.Arabigo) {
        answerNum = getArabigoNumber(list: inputListNumMaya);
      } else {
        answerNum = int.tryParse(inputListNumArabigo.join());
      }

      setState(() {
        inputListNumMaya.clear();
        inputListNumMaya = [[]];
        indexMaya = 0;
        inputListNumArabigo.clear();
      });
      context.read<PlaysProvider>().addAnswer(answer: answerNum);
    }
  }

  void _gameCompleted() async {
    Navigator.of(context).pop();
  }
}

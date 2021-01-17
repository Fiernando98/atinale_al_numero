import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MayaRowItem extends StatelessWidget {
  final List<int> listNumbers;

  MayaRowItem({@required this.listNumbers});

  @override
  Widget build(BuildContext context) {
    if (listNumbers.isEmpty) return Container();
    List<Widget> xList = [];
    if (listNumbers.contains(1)) {
      List<Widget> rowsList = [];
      listNumbers.where((element) => element == 1).toList().forEach((element) {
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
    if (listNumbers.contains(5)) {
      listNumbers.where((element) => element == 5).toList().forEach((element) {
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
    if (listNumbers.contains(0)) {
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
}

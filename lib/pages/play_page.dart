import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numeracion_maya/utilitys/providers/plays_providers.dart';
import 'package:provider/provider.dart';

class PlayPage extends StatefulWidget {
  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _widgetNumber() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.all(20),
          child: Text(
            "${context.watch<PlaysProvider>().playsList[context.watch<PlaysProvider>().answersList.length].num}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 70),
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
            children: [_widgetNumber()],
          ),
        ),
      ),
    );
  }
}

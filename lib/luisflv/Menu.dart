import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numeracion_maya/luisflv/PaginaJuego.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Numeros"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Iniciar"),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => PaginaJuego()),
            );
          },
        ),
      ),
    );
  }
}

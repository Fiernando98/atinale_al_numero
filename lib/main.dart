import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:numeracion_maya/pages/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: [
          Locale('en'),
          Locale('es')
        ],
        debugShowCheckedModeBanner: false,
        title: 'Atinale Al Numero',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.purple[600],
          accentColor: Colors.deepPurpleAccent[200],
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.purple[800],
          accentColor: Colors.deepPurpleAccent[700],
        ),
        home: SplashScreen());
  }
}

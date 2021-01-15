import 'package:flutter/cupertino.dart';

String getLanguage(BuildContext context) {
  Locale locale = Localizations.localeOf(context);
  return locale.languageCode ?? "en";
}

Map<String, Map<String, String>> getTranslation = {
  "en": {
    "Welcome": "Welcome",
    "Start": "Start",
    "Loading": "Loading",
    "Plays": "Plays",
    "Cancel": "Cancel",
    "Close": "Close",
    "DoYouWantToCloseThisPage": "Do You Want To Close This Page ?"
  },
  "es": {
    "Welcome": "Bienvenido",
    "Start": "Comenzar",
    "Loading": "Cargando",
    "Plays": "Jugadas",
    "Cancel": "Cancelar",
    "Close": "Cerrar",
    "DoYouWantToCloseThisPage": "¿Quiere Cerrar esta Página?"
  }
};

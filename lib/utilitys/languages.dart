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
    "Plays": "Plays"
  },
  "es": {
    "Welcome": "Bienvenido",
    "Start": "Comenzar",
    "Loading": "Cargando",
    "Plays": "Jugadas"
  }
};

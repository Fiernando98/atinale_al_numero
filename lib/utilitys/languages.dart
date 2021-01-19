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
    "DoYouWantToCloseThisPage": "Do You Want To Close This Page ?",
    "Answer": "Answer",
    "NumberCannotBeNull": "The Number Cannot Be Null",
    "Score": "Score",
    "YourAnswer": "Your Answer",
    "GoBackToMenu": "Go Back to the Menu",
    "Correct": "Correct",
    "Incorrect": "Incorrect",
    "SelectDifficulty": "Select Difficulty",
    "Beginner": "Beginner",
    "Easy": "Easy",
    "Normal": "Normal",
    "Hard": "Hard",
    "VeryHard": "VeryHard",
    "Insane": "Insane",
    "Legend": "Legend",
    "OkWeKnowYouAreGoingtoUseYourCalculator":
        "Ok We Know You Are Going to Use Your Calculator",
    "TakeYourTimeDontWorry": "Take Your Time, Don't Worry"
  },
  "es": {
    "Welcome": "Bienvenido",
    "Start": "Comenzar",
    "Loading": "Cargando",
    "Plays": "Jugadas",
    "Cancel": "Cancelar",
    "Close": "Cerrar",
    "DoYouWantToCloseThisPage": "¿Quiere Cerrar esta Página?",
    "Answer": "Contestar",
    "NumberCannotBeNull": "El Número no puede ser Nulo",
    "Score": "Puntuación",
    "YourAnswer": "Tu Respuesta",
    "GoBackToMenu": "Volver al Menú",
    "Correct": "Correcto",
    "Incorrect": "Incorrecto",
    "SelectDifficulty": "Seleccionar Dificultad",
    "Beginner": "Principiante",
    "Easy": "Fácil",
    "Normal": "Normal",
    "Hard": "Difícil",
    "VeryHard": "Muy Difícil",
    "Insane": "Insano",
    "Legend": "Legendario",
    "OkWeKnowYouAreGoingtoUseYourCalculator":
        "Ok, Sabemos Que Vas a Usar Tu Calculadora",
    "TakeYourTimeDontWorry": "Tómate Tu Tiempo, No Te Preocupes"
  }
};

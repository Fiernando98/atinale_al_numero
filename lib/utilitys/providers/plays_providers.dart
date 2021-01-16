import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:numeracion_maya/models_class/numbers.dart';

class PlaysProvider with ChangeNotifier {
  List<Numbers> _playsList = [];

  List<int> _answersList = [];

  List<Numbers> get playsList => _playsList;

  List<int> get answersList => _answersList;

  void makePlays({@required List<Numbers> newList}) {
    _playsList = newList;
    _answersList.clear();
    notifyListeners();
  }

  void addAnswer({@required int answer}) {
    _answersList.add(answer);
    print(_answersList);
    notifyListeners();
  }

  Numbers getCurrentPlay() {
    if (_playsList.length == _answersList.length) return null;
    return _playsList[_answersList.length];
  }
}

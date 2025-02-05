import 'package:flutter/foundation.dart';
import 'package:sdrawkcab/models/phrase.dart';
import 'package:uuid/uuid.dart';

class HistoryProvider with ChangeNotifier {
  List<Phrase> history = [];

  getHistory() {
    return history;
  }

  addPhraseToHistory(String phrase) {
    final newPhrase = Phrase(Uuid().v1(), phrase);
    history.add(newPhrase);
    notifyListeners();
  }
}

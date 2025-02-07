import 'package:flutter/foundation.dart';
import 'package:sdrawkcab/models/phrase.dart';
import 'package:uuid/uuid.dart';

class PhraseProvider with ChangeNotifier {
  List<Phrase> history = [];

  getHistory() {
    return history;
  }

  addPhraseToHistory(String phrase) {
    final newPhrase = Phrase(Uuid().v1(), phrase, reversePhrase(phrase));
    history.add(newPhrase);
    notifyListeners();
    return newPhrase;
  }

  reversePhrase(String text) {
    //Primeiro, transforma o texto em uma lista
    List<String> characters = text.toLowerCase().split('');
    // Depois, inverte os itens da lista, e junta tudo em uma string
    String reversedString = characters.reversed.join('');
    return reversedString;
  }

  removePhrase(Phrase phrase) {
    history.remove(phrase);
    notifyListeners();
  }
}

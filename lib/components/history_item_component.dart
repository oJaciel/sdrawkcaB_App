import 'package:flutter/material.dart';
import 'package:sdrawkcab/models/phrase.dart';
import 'package:sdrawkcab/providers/tts_provider.dart';

class HistoryItemComponent extends StatelessWidget {
  final Phrase phrase;

  const HistoryItemComponent(this.phrase);

  @override
  Widget build(BuildContext context) {
    //Instanciando e inicializando o Tts
    final ttsProvider = TtsProvider();
    ttsProvider.initTts();

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          title: Text(
            phrase.reversedPhrase,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            phrase.phrase,
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
          leading: SizedBox(
            height: 36,
            width: 36,
            child: IconButton(
              style: IconButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary),
              iconSize: 24,
              padding: EdgeInsets.all(5),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () => ttsProvider.speak(phrase.reversedPhrase),
              icon: Icon(Icons.play_arrow),
            ),
          ),
        ),
      ),
    );
  }
}

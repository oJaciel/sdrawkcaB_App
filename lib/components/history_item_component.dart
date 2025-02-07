import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdrawkcab/models/phrase.dart';
import 'package:sdrawkcab/providers/phrase_provider.dart';
import 'package:sdrawkcab/providers/tts_provider.dart';

class HistoryItemComponent extends StatelessWidget {
  final Phrase phrase;

  const HistoryItemComponent(this.phrase);

  @override
  Widget build(BuildContext context) {
    //Instanciando e inicializando o Tts
    final ttsProvider = TtsProvider();
    ttsProvider.initTts();

    return Dismissible(
      key: ValueKey(phrase.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      onDismissed: (_) {
        Provider.of<PhraseProvider>(context, listen: false)
            .removePhrase(phrase);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
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
              height: 40,
              width: 65,
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
      ),
    );
  }
}

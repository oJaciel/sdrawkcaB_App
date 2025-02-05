import 'package:flutter/material.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';
import 'package:provider/provider.dart';
import 'package:sdrawkcab/providers/phrase_provider.dart';
import 'package:sdrawkcab/providers/tts_provider.dart';

class ResultComponent extends StatelessWidget {
  final String id;

  ResultComponent(this.id);

  @override
  Widget build(BuildContext context) {
    // Pegar o provider do histórico
    final provider = Provider.of<PhraseProvider>(context, listen: false);

    // Buscar a frase pelo ID
    final phrase = provider.getHistory().firstWhere(
          (p) => p.id == id,
          orElse: () => throw Exception("Frase não encontrada"),
        );

//Instanciando e inicializando o Tts
    final ttsProvider = TtsProvider();
    ttsProvider.initTts();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.075,
      ),
      child: Column(
        children: [
          Text(
            '${phrase.phrase} ao contrário é:',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.025,
          ),
          Text(
            phrase.reversedPhrase,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Toque para ouvir ao contrário',
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
          PrettyWaveButton(
            backgroundColor: Theme.of(context).colorScheme.primary,
            onPressed: () => ttsProvider.speak(phrase.reversedPhrase),
            child: Icon(
              Icons.play_arrow_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

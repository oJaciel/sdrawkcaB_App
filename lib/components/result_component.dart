import 'package:flutter/material.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';
import 'package:sdrawkcab/providers/tts_provider.dart';

class ResultComponent extends StatelessWidget {
  final String text;

  ResultComponent(this.text);

  @override
  Widget build(BuildContext context) {
//Instanciando e inicializando o Tts
    final provider = TtsProvider();
    provider.initTts();

    //Função para reverter o texto recebido
    String reverseText() {
      //Primeiro, transforma o texto em uma lista
      List<String> characters = text.toLowerCase().split('');
      // Depois, inverte os itens da lista, e junta tudo em uma string
      String reversedString = characters.reversed.join('');
      return reversedString;
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.1,
      ),
      child: Column(
        children: [
          Text(
            '$text ao contrário é:',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.025,
          ),
          Text(
            reverseText(),
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
              style: TextStyle(
                fontSize: 12
              ),
              textAlign: TextAlign.center,
            ),
          ),
          PrettyWaveButton(
            backgroundColor: Theme.of(context).colorScheme.primary,
            onPressed: () => provider.speak(reverseText()),
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

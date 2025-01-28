import 'package:flutter/material.dart';
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
      //Senão, reverte o texto
      List<String> characters = text.split('');
      // Reverse the order and join the characters
      String reversedString = characters.reversed.join('');
      return reversedString;
    }

    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Text(reverseText()),
          FloatingActionButton(
            onPressed: () => provider.speak(reverseText()),
            child: Text('Falar'),
          ),
        ],
      ),
    );
  }
}

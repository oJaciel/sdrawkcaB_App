import 'package:flutter/material.dart';
import 'package:sdrawkcab/providers/tts_provider.dart';

class ResultComponent extends StatelessWidget {
  const ResultComponent({super.key});

  @override
  Widget build(BuildContext context) {
//Instanciando e inicializando o Tts
    final provider = TtsProvider();
    provider.initTts();

    // Recebendo o texto do formulário
    final text = ModalRoute.of(context)?.settings.arguments as String?;

    //Função para reverter o texto recebido
    String reverseText() {
      //Se o texto for nulo (nunca vai ser), retorna null
      if (text == null || text.isEmpty) {
        return 'Valor nulo';
      }
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

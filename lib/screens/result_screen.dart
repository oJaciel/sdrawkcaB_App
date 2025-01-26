import 'package:flutter/material.dart';
import 'package:sdrawkcab/providers/tts_provider.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Instanciando e inicializando o Tts
    final provider = TtsProvider();
    provider.initTts();

    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado'),
      ),
      body: FloatingActionButton(
        onPressed: () =>
            provider.speak('Teste'),
      ),
    );
  }
}

import 'package:flutter_tts/flutter_tts.dart';

class TtsProvider {
  late FlutterTts flutterTts;

  void initTts() {
    flutterTts = FlutterTts();
  }

  Future<void> speak(String text) async {
    await flutterTts.speak(text);
  }
}

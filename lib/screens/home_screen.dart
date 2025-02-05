import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdrawkcab/components/result_component.dart';
import 'package:sdrawkcab/providers/history_provider.dart';

class HomeScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final formController = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HistoryProvider>(context);

    _openResultModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return ResultComponent(provider.reversePhrase(formController.text));
      },
    );
  }

    return Form(
      key: _formKey,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextFormField(
                controller: formController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira algum texto';
                  }
                  return null;
                },
                textAlign: TextAlign.center,
                decoration:
                    const InputDecoration(hintText: "Digite uma palavra"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _openResultModal(context);
                    provider.addPhraseToHistory(formController.text);
                  }
                },
                child: const Text(
                  'Enviar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

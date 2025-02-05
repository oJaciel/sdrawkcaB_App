import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdrawkcab/components/result_component.dart';
import 'package:sdrawkcab/providers/phrase_provider.dart';

class HomeScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final formController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PhraseProvider>(context);

    _openResultModal(BuildContext context, String id) {
      showModalBottomSheet(
        context: context,
        builder: (_) {
          return ResultComponent(id);
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
                    final newPhrase =
                        provider.addPhraseToHistory(formController.text);
                    _openResultModal(context, newPhrase.id);
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

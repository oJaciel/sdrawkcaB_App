import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdrawkcab/components/result_component.dart';
import 'package:sdrawkcab/providers/history_provider.dart';

class FormComponent extends StatefulWidget {
  const FormComponent({super.key});

  @override
  State<FormComponent> createState() => _FormComponentState();
}

final _formKey = GlobalKey<FormState>();

class _FormComponentState extends State<FormComponent> {
  final formController = TextEditingController();

  _openResultModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return ResultComponent(formController.text);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HistoryProvider>(context);

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
                child: Text(
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

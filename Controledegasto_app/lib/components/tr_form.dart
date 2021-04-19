import 'package:flutter/material.dart';

class Trform extends StatefulWidget {
  final void Function(String, double) onSubmit;
  Trform(this.onSubmit);

  @override
  _TrformState createState() => _TrformState();
}

class _TrformState extends State<Trform> {
  final titleController = TextEditingController();

  final valorController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final valor = double.tryParse(valorController.text) ?? 0.0;
    if (title.isEmpty || valor <= 0) {
      return;
    }
    widget.onSubmit(title, valor);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Titulo'),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: valorController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: _submitForm,
                  child: Text(
                    'Nova Transação',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

//formulario

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Trform extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;
  Trform(this.onSubmit);

  @override
  _TrformState createState() => _TrformState();
}

class _TrformState extends State<Trform> {
  final _titleController = TextEditingController();

  final _valorController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  //validar informação
  _submitForm() {
    final title = _titleController.text;
    final valor = double.tryParse(_valorController.text) ?? 0.0;
    if (title.isEmpty || valor <= 0 || _selectedDate == null) {
      return;
    }
    widget.onSubmit(title, valor, _selectedDate);
  }

  //abrir o calendario
  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Titulo'),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: _valorController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'Nenhuma data selecionada!'
                        : 'Data selecionada ${DateFormat('dd/MM/yy').format(_selectedDate)}'),
                  ),
                  FlatButton(
                      onPressed: _showDatePicker,
                      child: Text(
                        'Selecionar uma data',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.purple),
                      ))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RaisedButton(
                  onPressed: _submitForm,
                  child: Text(
                    'Nova Transação',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.purple,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

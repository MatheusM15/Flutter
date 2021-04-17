import 'package:flutter/material.dart';
import 'tr_form.dart';
import 'transaction_list.dart';
import '../transaction.dart';

class Truser extends StatefulWidget {
  @override
  _TruserState createState() => _TruserState();
}

class _TruserState extends State<Truser> {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo tenis de corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de luz',
      value: 211.30,
      date: DateTime.now(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions),
        Trform(),
      ],
    );
  }
}

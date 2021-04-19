import 'package:flutter/material.dart';
import 'package:udemy_projeto1/components/tr_form.dart';

import 'dart:math';
import 'components/tr_form.dart';
import 'components/transaction_list.dart';
import 'transaction.dart';

main() => runApp(MaterialApp(
      title: "App de financia",
      home: MyApp(),
    ));

class MyAppState extends State<MyApp> {
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
  _addTranscation(String title, double value) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());
    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  _openFromModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Trform(_addTranscation);
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple, accentColor: Colors.amber),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            "Despesas Pessoais",
            style: TextStyle(color: Colors.amber, fontSize: 25),
          )),
          actions: [
            IconButton(
                icon: Icon(Icons.add), onPressed: () => _openFromModal(context))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Card(
                  color: Colors.blue,
                  child: Text('teste'),
                  elevation: 5,
                ),
              ),
              TransactionList(_transactions),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _openFromModal(context),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

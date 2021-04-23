import 'package:flutter/material.dart';
import 'package:udemy_projeto1/components/tr_form.dart';

import 'dart:math';
import 'components/tr_form.dart';
import 'components/transaction_list.dart';
import 'transaction.dart';
import 'components/chart.dart';

main() => runApp(MaterialApp(
      title: "App de financia",
      home: MyApp(),
    ));

class MyAppState extends State<MyApp> {
  final List<Transaction> _transactions = [];

  List<Transaction> get _recenTRansactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  _addTranscation(String title, double value, DateTime date) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: date);
    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) {
        return tr.id == id;
      });
    });
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
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                button: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ))),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            "Despesas Pessoais",
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
              Chart(_recenTRansactions),
              TransactionList(_transactions, _deleteTransaction),
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

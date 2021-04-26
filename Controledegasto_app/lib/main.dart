import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:udemy_projeto1/components/tr_form.dart';

import 'dart:math';
import 'dart:io';
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
  bool _showChart = false;

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
    bool _isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    Widget _getIconButton(IconData icon, Function fn) {
      return Platform.isIOS
          ? GestureDetector(
              onTap: fn,
              child: Icon(icon),
            )
          : IconButton(icon: Icon(icon), onPressed: fn);
    }

    final actions = [
      if (_isLandScape)
        _getIconButton(
          _showChart ? Icons.list : Icons.pie_chart,
          () {
            setState(() {
              _showChart = !_showChart;
            });
          },
        ),
      _getIconButton(Icons.add, () => _openFromModal(context)),
    ];

    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text("Despesas Pessoais"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: actions,
            ),
          )
        : AppBar(
            title: Center(
                child: Text(
              "Despesas Pessoais",
            )),
            actions: actions);

    final availabeHeigh = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    final bodyPage = SafeArea(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (_showChart || !_isLandScape)
            Container(
                height: availabeHeigh * (_isLandScape ? 0.7 : 0.3),
                child: Chart(_recenTRansactions)),
          if (!_showChart || !_isLandScape)
            Container(
                height: availabeHeigh * 0.7,
                child: TransactionList(_transactions, _deleteTransaction)),
        ],
      ),
    ));

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
      home: Platform.isIOS
          ? CupertinoPageScaffold(navigationBar: appBar, child: bodyPage)
          : Scaffold(
              appBar: appBar,
              body: bodyPage,
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () => _openFromModal(context),
              ),
              floatingActionButtonLocation: Platform.isIOS
                  ? Container()
                  : FloatingActionButtonLocation.centerFloat,
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

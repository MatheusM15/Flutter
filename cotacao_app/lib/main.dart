import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pag2.dart';

main() => runApp(MaterialApp(
      title: 'cotacao',
      home: MyApp(),
    ));

class StateMyApp extends State<MyApp> {
  final valor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Cotação')),
          backgroundColor: Colors.black,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Column(
            children: [
              TextField(
                controller: valor,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'valor em reais:',
                ),
              ),
              RaisedButton(
                  color: Colors.amber,
                  child: Text(
                    'calcular',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Resultado(valor.text)));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  StateMyApp createState() {
    return StateMyApp();
  }
}

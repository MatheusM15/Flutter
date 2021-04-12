import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pag2.dart';

main() => runApp(MaterialApp(
      title: 'teste',
      home: MyApp(),
    ));

class StateMyApp extends State<MyApp> {
  final valor1 = TextEditingController();
  final valor2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Vale a pena abstecer com gasolina? "),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 20),
              TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: valor1,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'valor da gasolina',
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ))),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: valor2,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'valor do etanol',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.amber,
                child: Text('Fazer calculo'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Pagina2(valor1.text, valor2.text)));
                },
              ),
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

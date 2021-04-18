import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pagina_2.dart';

main() => runApp(MaterialApp(
      title: "salario",
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final salarioB = TextEditingController();
  final numeroD = TextEditingController();
  final horasT = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Center(
            child: Text(
              'Calcular Salario',
              style: TextStyle(
                  color: Colors.purple,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: salarioB,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                        borderRadius:
                            BorderRadius.all(const Radius.circular(10))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                        borderRadius:
                            BorderRadius.all(const Radius.circular(10))),
                    labelText: "Salario Hora",
                    labelStyle: TextStyle(color: Colors.purple)),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                  controller: horasT,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                          borderRadius:
                              BorderRadius.all(const Radius.circular(10))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                          borderRadius:
                              BorderRadius.all(const Radius.circular(10))),
                      labelText: "Horas trabalhadas",
                      labelStyle: TextStyle(color: Colors.purple))),
              SizedBox(
                height: 20,
              ),
              TextField(
                  controller: numeroD,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                          borderRadius:
                              BorderRadius.all(const Radius.circular(10))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                          borderRadius:
                              BorderRadius.all(const Radius.circular(10))),
                      labelText: "Numero depedentes",
                      labelStyle: TextStyle(color: Colors.purple))),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Resultado(
                              salarioB.text, horasT.text, numeroD.text)));
                },
                child: Text(
                  "Calcular salario bruto",
                  style: TextStyle(color: Colors.purple),
                ),
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}

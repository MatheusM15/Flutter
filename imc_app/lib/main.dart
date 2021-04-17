import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'cal_imc.dart';

main() => runApp(MaterialApp(
      title: "IMC",
      home: Myapp(),
    ));

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  final valor = TextEditingController();
  final alt = TextEditingController();
  int radius = 20;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'CALCULO DE IMC',
              style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: valor,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(const Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.purple)),
                  hintText: 'ALTURAR',
                  hintStyle: TextStyle(
                      color: Colors.purple.withOpacity(0.7), fontSize: 15),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: alt,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                      borderRadius:
                          BorderRadius.all(const Radius.circular(10))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                      borderRadius:
                          BorderRadius.all(const Radius.circular(10))),
                  hintText: 'PESO',
                  hintStyle: TextStyle(
                      color: Colors.purple.withOpacity(0.7), fontSize: 15),
                ),
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Cal(valor.text, alt.text)));
                  },
                  child: Text(
                    "CALCULAR IMC",
                    style: TextStyle(color: Colors.purple),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

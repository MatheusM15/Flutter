import 'package:flutter/material.dart';

class Pagina2 extends StatelessWidget {
  final texto;
  final texto1;

  Pagina2(this.texto, this.texto1);
  get valor1 => double.parse(texto);
  get valor2 => double.parse(texto1);

  String calcular() {
    // ignore: unused_local_variable
    if ((valor1 / valor2) <= 0.7) {
      return 'Gasolina';
    } else {
      return 'Etanol';
    }
  }

  get melhor => calcular();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
              child: Text(
            'Qual compensar?',
          )),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 250),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'compensa:' + melhor,
                  style: TextStyle(color: Colors.amber, fontSize: 40),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

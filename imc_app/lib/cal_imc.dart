import 'package:flutter/material.dart';

class Cal extends StatelessWidget {
  final peso;
  final alturar;

  Cal(this.peso, this.alturar);
  get alturarDouble => double.parse(alturar);
  get pesoDouble => double.parse(peso);
  String calcular() {
    double imc = this.pesoDouble / (this.alturarDouble * this.alturarDouble);
    print(alturarDouble);
    print(pesoDouble);
    return imc.toString();
  }

  get imc => calcular();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("RESULTADO"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [Text(imc)],
          ),
        ),
      ),
    );
  }
}

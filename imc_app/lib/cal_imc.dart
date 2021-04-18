import 'package:flutter/material.dart';

class Cal extends StatelessWidget {
  final peso;
  final alturar;

  Cal(this.alturar, this.peso);
  get alturarDouble => double.parse(alturar);
  get pesoDouble => double.parse(peso);
  String calcular() {
    double imc = this.pesoDouble / (this.alturarDouble * this.alturarDouble);
    if (imc >= 16 && imc <= 16.9) {
      return "Muito abaixo do peso";
    } else if (imc >= 17 && imc <= 18.4) {
      return "Abaixo do peso";
    } else if (imc >= 18.5 && imc <= 24.9) {
      return "peso ideal";
    } else if (imc >= 25 && imc <= 29.9) {
      return "Acima do peso";
    } else if (imc >= 30 && imc <= 34.9) {
      return "Obesidade I";
    } else if (imc >= 35 && imc <= 40) {
      return "Obesidade II";
    } else if (imc > 40) {
      return "Obesidade III";
    } else {
      return "Muito abaixo";
    }
  }

  get imc => calcular();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "RESULTADO",
              style: TextStyle(
                  color: Colors.purple,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(imc,
                style: TextStyle(
                    color: Colors.purple,
                    fontSize: 25,
                    fontWeight: FontWeight.bold))
          ]),
        ),
      ),
    );
  }
}

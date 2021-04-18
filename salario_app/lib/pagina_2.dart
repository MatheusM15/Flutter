import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final salario;
  final horas;
  final depe;

  Resultado(this.salario, this.horas, this.depe);

  get salariod => double.parse(salario);
  get horasd => double.parse(horas);
  get deped => int.parse(depe);

  double calcularBruto() {
    double salarioB = horasd * salariod + (50 * deped);
    return salarioB;
  }

  get salarioBruto => calcularBruto();

  double descontoInss() {
    if (salarioBruto <= 1000) {
      return salarioBruto * 8.5 / 100;
    } else {
      return salarioBruto * 9 / 100;
    }
  }

  get descontInss => descontoInss();

  double descontoIr() {
    if (salarioBruto <= 500) {
      return 0;
    } else if (salarioBruto > 500 && salarioBruto <= 1000) {
      return salarioBruto * 5 / 100;
    } else {
      return salarioBruto * 7 / 100;
    }
  }

  get descontIr => descontoIr();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Salario liquido",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
            ),
          ),
          backgroundColor: Colors.grey,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Salario bruto: " + salarioBruto.toString(),
                style: TextStyle(
                    color: Colors.purple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text("Desconto INSS: " + descontInss.toString(),
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Text("Desconto IR: " + descontIr.toString(),
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 20,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}

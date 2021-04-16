import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final valor;
  Resultado(this.valor);
  get resul => double.parse(valor);
  double calDolar() {
    return resul * 5.73;
  }

  double calEuro() {
    return resul * 6.8;
  }

  get dolar => calDolar();
  get euro => calEuro();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(child: Text('Resultado:')),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 100, top: 200),
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(children: [
                Image.asset(
                  'assets/euro.png',
                  height: 100,
                  width: 100,
                ),
                Text(
                  'Euro = ' + euro.toString(),
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 25,
                  ),
                ),
              ]),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/dolar.jpg',
                    height: 100,
                    width: 100,
                  ),
                  Text(
                    'Dolar = ' + dolar.toString(),
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 25,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String valor;
  Questao(this.valor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        this.valor,
        style: TextStyle(
          fontSize: 28,
          color: Colors.blue,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

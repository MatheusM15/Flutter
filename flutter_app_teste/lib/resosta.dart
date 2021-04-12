import 'package:flutter/material.dart';

class Resposta extends Navigator {
  final String resposta;
  final Function() quandoSelecionado;

  Resposta(this.resposta, this.quandoSelecionado);
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.black,
        child: Text(resposta),
        onPressed: (quandoSelecionado),
      ),
    );
  }
}

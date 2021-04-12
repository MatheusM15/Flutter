import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'questao.dart';
import 'resosta.dart';

main() => runApp(MyApp());

class MyAppState extends State<MyApp> {


  void responde() {
    setState(() {
      peguntaseleciona++;
    });
    print(peguntaseleciona);
  }

  void volta() {
    setState(() {
      peguntaseleciona--;
    });
    print(peguntaseleciona);
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        
        'resposta': ['azul','verde','preto'],
      }
      {
        'texto': 'qual sua comida favorita',
        'resposta': ['hambu','agua','bolo'],
      }
    ]

    var peguntaseleciona = 0;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white24,
          title: Center(child: Text('teste')),
        ),
        body: Center(
          child: Column(
            children: [
              Questao(perguntas[perguntaseleciona]['texto']),
              Resposta('resposta 1', responde),
              Resposta('resposta 1',responde),
              Resposta('resposta 1',responde),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

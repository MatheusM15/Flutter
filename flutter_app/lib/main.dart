import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Olá Flutter 2",
    home: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: "menu de navegação",
          onPressed: null,
        ),
        title: Text("Cotação de moeda",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.blue.shade500,
        actions: [
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 16,width: 10),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Valor em reais",
                    labelText: "valor",
                    labelStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.black,

                    ),
                  border: OutlineInputBorder()
                ),
              ),
            ),
        SizedBox(height: 16),
        RaisedButton(onPressed: () {
          print("teste");
        },
          child: Text("converter"),
        )




        ],
      ),
    ),
  ));
}
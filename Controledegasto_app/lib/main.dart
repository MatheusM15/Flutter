import 'package:flutter/material.dart';
import 'components/te_user.dart';

main() => runApp(MaterialApp(
      title: "App de financia",
      home: MyApp(),
    ));

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
              child: Text(
            "Despesas Pessoais",
            style: TextStyle(color: Colors.amber, fontSize: 25),
          )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Card(
                color: Colors.blue,
                child: Text('teste'),
                elevation: 5,
              ),
            ),
            Truser(),
          ],
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

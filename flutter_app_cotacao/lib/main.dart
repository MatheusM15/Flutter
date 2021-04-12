import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "cotação",
    home: Myapp(),
));

class Myapp extends StatelessWidget{
  final valor = new TextEditingController();
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(

        appBar: AppBar(
          title: Center(
            child: Text("Cotação de moedas",
              style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white,
            ),

            ),
          ),

        ),
        body: SingleChildScrollView(
          reverse: false,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(5),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    child: Image.asset('assets/img/dolar.jpg'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    controller: valor,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'valor:',
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 50,
                    width: 150,

                   child: RaisedButton(
                     child: Text("Teste"),
                     onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => Resultado(valor);
                       );
                     },
                   ),
                  )
                ],
              ),

            ),
          ),
        ),
      ),
    );
  }

}

class Resultado extends StatelessWidget{




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text("Resultado:"),
          ),
        ),
        body: SingleChildScrollView(
          reverse: false,
         child: Container(
           alignment: Alignment.center,
           padding: EdgeInsets.all(5),
           child: Align(
             alignment: Alignment.center,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 
               ],
             ),
           ),
         ),
        ),

      ),
    );
  }

}





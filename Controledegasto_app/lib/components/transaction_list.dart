//Mostrar a lista
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final void Function(String) onRemove;
  TransactionList(this.transaction, this.onRemove);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: transaction.isEmpty
            ? LayoutBuilder(builder: (cxt, constraints) {
                return Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Nenhuma Transação Cadastrada',
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset('assets/imagem/waiting.png'),
                    ),
                  ],
                );
              })
            : ListView.builder(
                itemCount: transaction.length,
                itemBuilder: (ctx, index) {
                  final tr = transaction[index];
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          child: Container(
                            padding: EdgeInsets.all(6),
                            child: FittedBox(child: Text('R\$${tr.value}')),
                          )),
                      title: Text(
                        tr.title,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans'),
                      ),
                      subtitle: Text(
                        DateFormat('d MMM y').format(tr.date),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () => onRemove(tr.id),
                      ),
                    ),
                  );
                },
              ));
  }
}

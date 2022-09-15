import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
final textController = TextEditingController();
final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: textController,
              decoration: const InputDecoration(labelText: 'Titulo'),
            ),
            TextField(
              controller: valueController,
              decoration: const InputDecoration(labelText: 'Valor'),
            ),
            FlatButton(
              child: Text('Nova transação'),
              textColor: Color.fromARGB(255, 124, 0, 68),
              onPressed: () {
                print(textController);
                print(valueController);
              },
            )
          ],
        ),
      ),
    );
  }
}

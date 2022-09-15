import 'package:expenses_project/Components/transaction_form.dart';
import 'package:expenses_project/Components/transaction_list.dart';
import 'package:expenses_project/Models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {



  final _transaction = [
    Transaction(
      id: 't1',
      title: 'Tênis de corrida',
      value: 310.90,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 120.52,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: const Card(
              color: Colors.blueAccent,
              elevation: 6,
              child: Text('Gráfico'),
            ),
          ),
          TransactionList(_transaction),
          TransactionForm(),
        ],
      ),
    );
  }
}

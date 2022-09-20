import 'package:expenses_project/Components/chart.dart';
import 'package:expenses_project/Components/transaction_form.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import './Components/transaction_form.dart';
import './Components/transaction_list.dart';
import '/Models/transaction.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Combo',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transaction = [
      Transaction(
        id: 't1',
        title: 'Tênis de corrida',
        value: 310.90,
        date: DateTime.now().subtract(Duration(days: 3)),
      ),
      Transaction(
        id: 't3',
        title: 'Celular ',
        value: 1300.00,
        date: DateTime.now(),
      ),
      Transaction(
        id: 't2',
        title: 'Conta de Luz',
        value: 120.52,
        date: DateTime.now().subtract(Duration(days: 4)),   
      ),
  ];

  List<Transaction> get _recentTransactions {
    return _transaction.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
        id: Random().nextBool().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      _transaction.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: const <Widget>[
            Text(
              'Despesas Pessoais',
              style: TextStyle(
                  fontFamily: 'Combo',
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           Chart(_recentTransactions),            
            TransactionList(_transaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
    );
  }
}

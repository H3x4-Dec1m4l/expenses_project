import 'dart:math';
import 'dart:io';
import 'package:expenses_project/Components/chart.dart';
import 'package:expenses_project/Components/transaction_form.dart';
import 'package:flutter/material.dart';
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
   bool _showChart = false;
  final List<Transaction> _transaction = [
    Transaction(
      id: 't1',
      title: 'Tênis de corrida',
      value: 310.90,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: 't2',
      title: 'Celular ',
      value: 1300.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'cartão debito',
      value: 320.92,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    Transaction(
      id: 't5',
      title: 'console',
      value: 1250.52,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    Transaction(
      id: 't6',
      title: 'conta de agua',
      value: 120.52,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    Transaction(
      id: 't7',
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

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextBool().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transaction.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _removeTransactions(String id) {
    setState(() {
      _transaction.removeWhere((tr) {
        return tr.id == id;
      });
    });
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
    bool isLandscape = MediaQuery.of(context).orientation ==
    Orientation.landscape; //verificação de modo paisagem
    final appBar = AppBar(
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
          // IconButton( botão de alternancia de grafico pra lista no app bar
          //   icon: Icon (_showChart ? Icons.list : Icons.pie_chart),
          //   onPressed: () {
          //     setState(() {
          //       _showChart = !_showChart;
          //     });
          //   },
          // ),
        ],
      );
    final availableHeight = MediaQuery.of(context).size.height 
    - appBar.preferredSize.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if(isLandscape)
            Row( //linha do Switch para exibir o gráfico
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Text('Exibir gráfico'),
                Switch.adaptive(
                  activeColor: Theme.of(context).primaryColor,
                  value: _showChart, 
                  onChanged: (value){
                    setState(() {
                      _showChart = value;
                    });
                }),
              ],
            ),
            if(_showChart || !isLandscape) /*condição para exibir os gráficos
            em modo paisagem*/
             Container( 
              height: availableHeight * (isLandscape? 0.70: 0.30),
              child: Chart(_recentTransactions),
            ),
            if(!_showChart || !isLandscape) //condição para exibir a lista
            Container(
              height: availableHeight * 0.72,
              child: TransactionList(_transaction, _removeTransactions),
            ),
          ],
        ),
      ),
      //botão do formulário
      
      floatingActionButton: Platform.isIOS? Container() : 
      FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      
      //(deixa o botão de adição no meio) floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

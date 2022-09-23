import 'package:expenses_project/Models/transaction.dart';
import 'package:flutter/material.dart';
import '../Models/transaction.dart';
import 'package:intl/intl.dart';
import 'empty_list.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final void Function (String) onRemove;

  TransactionList(this.transaction, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? Column(
            children: const[
              Text ('Nenhuma transação Cadastrada',
              style: TextStyle(
                fontFamily: 'SecularOne',
                fontWeight: FontWeight.w700,
              ),
              )
            ],
          )
        : Card(
          elevation: 5,  
          margin:  const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 5,
          ),
            child: ListView.builder(
              itemCount: transaction.length,
              itemBuilder: (ctx, index) {
                final tr = transaction[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: FittedBox(
                        child: Text('R\$${tr.value.toStringAsFixed(2)}'),
                      ),
                    ),
                  ),
                  title: Text(
                    tr.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Text(DateFormat('d MMM y').format(tr.date),
                      style: const TextStyle(
                        color: Color.fromARGB(199, 142, 14, 165),
                        //fontFamily: ''
                      )
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () => onRemove(tr.id),
                      ),
                );
              },
            ),
          );
  }
}

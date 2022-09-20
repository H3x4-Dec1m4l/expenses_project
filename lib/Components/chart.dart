import 'package:expenses_project/Components/chart_bar.dart';
import 'package:flutter/material.dart';
import '../Models/transaction.dart';
import 'package:intl/intl.dart';
import '../main.dart';
class Chart extends StatelessWidget {
  final List<Transaction> recentsTransactions;

  Chart(this.recentsTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0;

      for (var i = 0; i < recentsTransactions.length; i++) {
        bool sameDay = recentsTransactions[i].date.day == weekDay.day;
        bool sameMonth = recentsTransactions[i].date.month == weekDay.month;
        bool sameYear = recentsTransactions[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentsTransactions[i].value;
        }
      }

      return {
        'Day': DateFormat.E().format(weekDay)[0],
        'Value': 9.99,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, tr){
       return sum + (tr['Value'] as double);
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: groupedTransactions.map((tr) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label:  tr['Day'] as String,
                value: tr['Value'] as double,
                percentage: (tr['Value'] as double) / _weekTotalValue,             
              ),
            );
          }).toList()),
        ));
  }
}

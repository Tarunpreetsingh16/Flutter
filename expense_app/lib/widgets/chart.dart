import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import './chartBar.dart';

class Chart extends StatelessWidget {
  List<Transaction> transactions;

  Chart(this.transactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalAmount = 0.0;

      for (var i = 0; i < transactions.length; i++) {
        if (transactions[i].dateTime.day == weekDay.day &&
            transactions[i].dateTime.month == weekDay.month &&
            transactions[i].dateTime.year == weekDay.year) {
          totalAmount += transactions[i].amount;
        }
      }
      print(DateFormat.E().format(weekDay));
      print(totalAmount);
      return {'day': DateFormat.E().format(weekDay), 'amount': totalAmount};
    });
  }

  double get totalSpending {
    return groupedTransactions.fold(0.0, (previousValue, element) {
      return previousValue + element['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groupedTransactions.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: Bar(
                  data['day'],
                  data['amount'],
                  totalSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}

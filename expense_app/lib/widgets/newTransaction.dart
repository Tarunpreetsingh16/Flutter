import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  Function fn;

  NewTransaction(this.fn);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime selectedDate;

  Transaction _newTransaction = Transaction();

  void newTransaction() {
    if (titleController.text.isEmpty ||
        double.parse(amountController.text) <= 0 ||
        selectedDate == null) {
      return;
    }
    _newTransaction = Transaction(
        id: DateTime.now().toString(),
        amount: double.parse(amountController.text),
        title: titleController.text,
        dateTime: selectedDate);
    widget.fn(_newTransaction);
    Navigator.of(context).pop();
  }

  void openDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020, 04, 01),
      lastDate: DateTime.now(),
    ).then(
      (value) {
        setState(() {
          selectedDate = value;
        });

      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                labelText: 'Title', labelStyle: TextStyle(fontSize: 15)),
            controller: titleController,
            onSubmitted: (_) => newTransaction(),
          ),
          TextField(
            decoration: InputDecoration(
                labelText: 'Amount', labelStyle: TextStyle(fontSize: 15)),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => newTransaction(),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              selectedDate == null
                  ? Text('No date chosen!')
                  : Text('Date chosen - ${DateFormat.yMMMd().format(selectedDate)}'),
              FlatButton(
                onPressed: () {
                  openDatePicker(context);
                },
                child: Text('Choose Date'),
              ),
            ],
          ),
          FlatButton(
            onPressed: newTransaction,
            child: Text(
              'Add Transaction',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}

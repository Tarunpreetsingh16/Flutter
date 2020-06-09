import 'package:flutter/material.dart';
import './widgets/newTransaction.dart';
import './models/transaction.dart';
import './widgets/chart.dart';
import 'package:intl/intl.dart';

void main() => runApp(AppStarted());

class AppStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expensify',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.yellow,
      ),
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Transaction> transactions =
      []; //stateful so that transactions are changed not the whole app refreshes
  void addTransaction(Transaction tx) {
    setState(() {
      transactions.add(tx);
    });
  }
  void deleteTransaction(int index){
    setState((){
      transactions.removeAt(index);
    });
  }

  List<Transaction> get recentTransactions {
    return transactions.where((tx) {
      return tx.dateTime.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void openDialogBox(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expensify'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                openDialogBox(context);
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(recentTransactions),
            Column(children: <Widget>[
              Container(
                height: 400,
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      elevation: 5,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Text(
                              "\$${transactions[index].amount.toStringAsFixed(2)}"),
                          radius: 30,
                        ),
                        title: Text(
                          transactions[index].title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          DateFormat.yMMMd()
                              .format(transactions[index].dateTime),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => deleteTransaction(index),
                          color: Theme.of(context).errorColor,
                        ),
                      ),
                    );
                  },
                  itemCount: transactions.length,
                ),
              )
            ]),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          openDialogBox(context);
        },
      ),
    );
  }
}

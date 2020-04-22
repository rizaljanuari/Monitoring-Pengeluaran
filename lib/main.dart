import 'package:expenses_planner/transaction.dart';
import 'package:flutter/material.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses Planner App',
      home: MyHomepage(),
    );
  }
}

class MyHomepage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: "tx1",
      amount: 350000,
      title: "Sepatu Rebook",
      date: DateTime.now(),
    ),
    Transaction(
      id: "tx2",
      amount: 200000,
      title: "Belanja Bulanan",
      date: DateTime.now(),
    ),
    Transaction(
      id: "tx3",
      amount: 8000,
      title: "Beli Thai Tea",
      date: DateTime.now(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Expenses Planner'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blueAccent,
              child: Text('Chart'),
            ),
          ),
          Column(
              children: transactions.map((tx) {
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Colors.black),
                    ),
                    child: SizedBox(
                      width: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text("Rp."),
                          Spacer(),
                          Text(
                            //using string interpolation, so i can have a string from number type without adding toSring() function
                            '${tx.amount}',
                            // tx.amount.toString(),  <= example if i choose to use without string interpolation
                        
                          ),
                        ],
                      ),
                    ),
                    padding: EdgeInsets.all(6),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        tx.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        tx.date.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList())
        ],
      ),
    );
  }
}

import 'package:expenses_planner/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

//TextEditingController agar input yang dimasukan langsung disimpan
final titleController = TextEditingController();
final amountController = TextEditingController();

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
          Card(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Nama Transaksi'),
                    controller: titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Nominal'),
                    controller: amountController,
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text('Tambah Transaksi', style: TextStyle(color: Colors.blueAccent),),
                  )
                ],
              ),
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
                        DateFormat.yMMMMEEEEd().format(tx.date),
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

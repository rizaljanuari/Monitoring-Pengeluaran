import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
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

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      amount: amount,
      title: title,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}

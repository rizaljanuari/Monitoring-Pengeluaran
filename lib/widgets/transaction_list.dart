import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: transactions.isEmpty
          ? Container(
              width: 150,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/empty_cart.png',
                    fit: BoxFit.cover,
                  ),
                  Text("Belum ada pengeluaran")
                ],
              ),
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 10),
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
                                '${transactions[index].amount.toStringAsFixed(0)}',
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
                            transactions[index].title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            DateFormat.yMMMMEEEEd()
                                .format(transactions[index].date),
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Overpass',
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

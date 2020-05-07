import 'package:expenses_planner/models/transaction.dart';
import 'package:expenses_planner/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      //
      // mcalculate the total amount each day
      //
      var totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalSum += recentTransaction[i].amount;
        }
      }
      return {
        "day": DateFormat.E().format(weekDay).substring(0, 2),
        "amount": totalSum,
      };
    });
  }

  double get maxSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      margin: EdgeInsets.all(16.0),
      child: Row(
        children: groupedTransactionValues.map((data) {
          // return Text('${data['day']} : ${data['amount']}');
          return ChartBar(data['day'], data['amount'],
              (data['amount'] as double) / maxSpending);
        }).toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:parsonal_expences/models/transection.dart';
import 'package:parsonal_expences/widgets/Chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transection> recentTransections;
  Chart(this.recentTransections);

  List<Map<String, dynamic>> get groupedTransectionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var i = 0; i < recentTransections.length; i++) {
        if (recentTransections[i].date.day == weekDay.day &&
            recentTransections[i].date.month == weekDay.month &&
            recentTransections[i].date.year == weekDay.year) {
          totalSum += recentTransections[i].amount;
        }
      }

      print(DateFormat.E().format(weekDay));
      print(totalSum);

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  get totalSpending {
    return groupedTransectionValues.fold(0.0, (previousValue, element) {
      return previousValue + (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransectionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
          children: groupedTransectionValues.map((data) {
        return ChartBar(
            label: data['day'],
            spendingAmount: data['amount'],
            spendingPctTotal: (data['amount'] as double) / totalSpending);
      }).toList()),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transection.dart';

class TransectionList extends StatelessWidget {
  final List<Transection> transections;
  TransectionList(this.transections);

  @override
  Widget build(BuildContext context) {
    print(transections);
    return Container(
      height: 380,
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: transections.length,
        itemBuilder: (context, index) => Card(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                child: Text(
                  '\$ ${transections[index].amount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple,
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
                    width: 2,
                  ),
                ),
                padding: EdgeInsets.all(10),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transections[index].title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat.yMMMd().format(transections[index].date),
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

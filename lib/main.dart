import 'package:flutter/material.dart';

import './widgets/add_transection.dart';
import './widgets/transection_list.dart';
import './models/transection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transection> _userTransections = [
    Transection(
      amount: 99.99,
      date: DateTime.now(),
      id: 't1',
      title: 'New Shoes',
    ),
    Transection(
      amount: 16.53,
      date: DateTime.now(),
      id: 't2',
      title: 'Weekly Groceries',
    ),
  ];

  void _addTransection(String title, double amount) {
    final newTx = Transection(
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
      title: title,
    );

    setState(() {
      _userTransections.add(newTx);
    });
    print(_userTransections);
  }

  void _sartAddNewTransection(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return Container(
          width: double.infinity,
          child: Text('TEST'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expense Tracker'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _sartAddNewTransection(context);
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.amber,
                child: Text('CHART!'),
              ),
            ),
            TransectionList(_userTransections)
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print('function CAlled');
            _sartAddNewTransection(context);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

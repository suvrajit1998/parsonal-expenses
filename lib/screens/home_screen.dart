import 'package:flutter/material.dart';
import 'package:parsonal_expences/models/transection.dart';
import 'package:parsonal_expences/widgets/add_transection.dart';
import 'package:parsonal_expences/widgets/chart.dart';
import 'package:parsonal_expences/widgets/transection_list.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Transection> _userTransections = [
    // Transection(
    //   amount: 99.99,
    //   date: DateTime.now(),
    //   id: 't1',
    //   title: 'New Shoes',
    // ),
    // Transection(
    //   amount: 16.53,
    //   date: DateTime.now(),
    //   id: 't2',
    //   title: 'Weekly Groceries',
    // ),
  ];

  List<Transection> get _recentTransections {
    return _userTransections.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

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
        return AddTransection(_addTransection);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expense Tracker',
          style: TextStyle(fontFamily: 'Open Sans'),
        ),
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
          Chart(_recentTransections),
          TransectionList(_userTransections)
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _sartAddNewTransection(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

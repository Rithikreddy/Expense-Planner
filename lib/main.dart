// ignore_for_file: deprecated_member_use

import 'widgets/new_transaction.dart';
import 'widgets/user_transaction.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'widgets/transactions_list.dart';
import 'widgets/chart.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New Sandals',
      amount: 59.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'New Slippers',
      amount: 49.99,
      date: DateTime.now(),
    ),
  ];

  var _counter = 3;
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: 't${_counter++}',
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    //use the build function context.
    //context is a meta information about that sheet which we are building.
    //bctx is different from ctx as ctx is main widget context whereas
    //bctx is a new context of the ModalSheet.
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Expense Planner App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //In card we can define some margin but no padding
              Chart(),
              UserTransaction(_userTransaction),
            ]),
      ),
      //Used for floating a button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //Floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}

import './new_transaction.dart';
import './transactions_list.dart';
import '../models/transaction.dart';
import 'package:flutter/material.dart';

class UserTransaction extends StatelessWidget {
  List<Transaction> userTransactions;
  UserTransaction(this.userTransactions);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(userTransactions),
      ],
    );
  }
}

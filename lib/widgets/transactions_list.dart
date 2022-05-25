import 'package:flutter/material.dart';
import './user_transaction.dart';
import '../../models/transaction.dart';
import 'package:intl/intl.dart';

//ListView Builder is the one of the Listview usecase where it loads only
//the visible items in the list which is an advantage compared to the ListView
//(children: [] which we used below.)
//ListView Builder is better to use if we have a list whose number is unknown.

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      //We cannot directly add a ListView here for a ListView we need to define
      //height constraint.
      height: 700,
      //Instead of column I have added a ListView(which has Infinite Height)
      //Instead of transactions.map() which is ListView(children: [])
      //we can use ListView.builder()
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                ),
                //Image.asset(name)
              ],
            )
          : ListView.builder(
              itemCount: transactions
                  .length, //definitely required to provide an index value
              itemBuilder: (context, index) {
                return Card(
                    child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      //decoration only for Container
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(4.0),
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '\$${transactions[index].amount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
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
                          DateFormat.yMMMd().format(transactions[index].date),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ));
              },
            ),
      //children: transactions.map((tx) {
      //}).toList(),
    );
  }
}

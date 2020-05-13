import 'package:flutter/material.dart';
import 'package:lab/model/transaction.dart';
import 'package:lab/widgets/new_transaction.dart';
import 'package:intl/intl.dart';


class UserTransactions extends StatefulWidget {
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [
    Transaction(
        id: 't1',
        title: 'Pay for Krapao Kai',
        amount: 200,
        date: DateTime.now(),
        reason: null),
    Transaction(
        id: 't2',
        title: 'Buy the new notebook',
        amount: 20000,
        date: DateTime.now(),
        reason: null),
  ];

  void addTransaction(String title, String amount) {
    setState(() {
      _transactions.add(Transaction(
          id: 't' + (_transactions.length + 1).toString(),
          title: title,
          amount: double.parse(amount),
          date: DateTime.now(),
          reason: null));
    });
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          NewTransaction(addTransaction),
          ..._transactions.map((tx) {
            return _buildCard(tx);
          }).toList()
        ],
      ),
    );
  }

  Widget _buildCard(Transaction tx) => SizedBox(
        height: 210,
        child: Card(
          child: Column(
            children: [
              ListTile(
                title: Text(tx.title,
                    style: TextStyle(fontWeight: FontWeight.w500)),
                subtitle: Text(tx.id),
                leading: Icon(
                  Icons.insert_emoticon,
                  color: Colors.blue[500],
                ),
              ),
              Divider(),
              ListTile(
                title: Text(tx.amount.toString(),
                    style: TextStyle(fontWeight: FontWeight.w500)),
                leading: Icon(
                  Icons.attach_money,
                  color: Colors.blue[500],
                ),
              ),
              ListTile(
                title: Text(new DateFormat('dd/MM/yyyy')
                    .format(tx.date)), // วัน/เดือน/ปี
                leading: Icon(
                  Icons.today,
                  color: Colors.blue[500],
                ),
              ),
            ],
          ),
        ),
      );
}

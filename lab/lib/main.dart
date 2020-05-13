import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter App', home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  List<Transaction> transactions = [
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
  var titleController = TextEditingController();
  var amountController = TextEditingController();
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
                title: Text(
                    new DateFormat('dd/MM/yy').format(tx.date)), // วัน/เดือน/ปี
                leading: Icon(
                  Icons.today,
                  color: Colors.blue[500],
                ),
              ),
            ],
          ),
        ),
      );

  showAlertDialog(BuildContext context, String title, String text) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(text),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                controller: amountController,
              ),
              FlatButton(
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                color: Colors.cyan,
                onPressed: () {
                  print('click BT');
                  if (titleController.text == '' ||
                      amountController.text == '') {
                    showAlertDialog(context, "Title", "Text");
                  } else {
                    transactions.insert(transactions.length + 1, Transaction());
                    
                    
                    // transactions = [
                    //   Transaction(
                    //       id: 't' + (transactions.length + 1).toString(),
                    //       title: titleController.text,
                    //       amount: double.parse(amountController.text),
                    //       date: DateTime.now(),
                    //       reason: null),
                    //   ...transactions
                    // ];
                    // setState() {}
                  }
                },
              ),
              ...transactions.map((tx) {
                return _buildCard(tx);
              }).toList()
            ]),
      )),
    );
  }
}

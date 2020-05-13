import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final String reason;
  final DateTime date;

  Transaction(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.reason,
      @required this.date});
}

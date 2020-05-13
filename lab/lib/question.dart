import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        this.questionText,
        style: TextStyle(
          fontSize: 28.0,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 6
            ..color = Colors.blue[700],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

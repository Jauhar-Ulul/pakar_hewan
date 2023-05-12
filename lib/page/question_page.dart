import 'package:flutter/material.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.yellow,
          ),
          onPressed: () => Navigator.of(context).pop(false),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 99, 99),
      body: Container(
        child: Text('Question Page'),
      ),
    );
  }
}

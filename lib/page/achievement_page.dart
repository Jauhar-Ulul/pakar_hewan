import 'package:flutter/material.dart';

class AchievementPage extends StatelessWidget {
  const AchievementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.yellowAccent),
          onPressed: () => Navigator.of(context).pop(false),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 99, 229, 255),
      body: Container(
        child: Text('achievement page'),
      ),
    );
  }
}

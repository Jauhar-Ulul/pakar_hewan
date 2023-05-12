import 'package:flutter/material.dart';
import 'question_page.dart';
import 'achievement_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String logoImage = 'assets/image/logo.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 99, 99),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 120,
              backgroundImage: AssetImage(logoImage),
            ),
            SizedBox(
              height: 30,
            ),
            IconButton(
              icon: Icon(
                Icons.play_circle_fill_rounded,
              ),
              iconSize: 80,
              color: Color.fromARGB(255, 2, 218, 255),
              splashRadius: 5,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuestionPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.workspace_premium_rounded,
              ),
              iconSize: 80,
              color: Color.fromARGB(255, 251, 244, 78),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AchievementPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

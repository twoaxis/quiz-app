import 'package:flutter/material.dart';
import 'package:quizapp/pages/home.dart';

class JoinQuiz extends StatelessWidget {
  const JoinQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Join Quiz'),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
          icon: Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

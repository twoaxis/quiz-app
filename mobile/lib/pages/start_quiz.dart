import 'package:flutter/material.dart';
import '../theme/theme.dart';

class StartQuiz extends StatelessWidget {
  const StartQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Start Quiz', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(textcolor),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'QUIZ',
              style: TextStyle(fontSize: 50),
            ),
            Text(
              'TIME',
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(
              height: 200,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(Buttoncolor)),
                onPressed: () {},
                child: Text(
                  'Start Quiz',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ))
          ],
        ),
      ),
    );
  }
}

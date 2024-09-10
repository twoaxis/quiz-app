import 'package:flutter/material.dart';
import 'package:quizapp/pages/create_quiz.dart';
import 'package:quizapp/pages/home.dart';
import '../theme/theme.dart';

class StartQuiz extends StatelessWidget {
  const StartQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
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
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Start Quiz',
          style: TextStyle(
            color: Colors.white,
            fontSize: deviceWidth * 0.05,
          ),
        ),
        backgroundColor: Color(textcolor),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'QUIZ',
              style: TextStyle(
                fontSize: deviceWidth * 0.15,
              ),
            ),
            Text(
              'TIME',
              style: TextStyle(
                fontSize: deviceWidth * 0.15,
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.2,
            ),
            SizedBox(
              width: deviceWidth * 0.7,
              height: deviceHeight * 0.08,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(Buttoncolor)),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateQuiz(),
                    ),
                  );
                },
                child: Text(
                  'Start Quiz',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: deviceWidth * 0.06,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

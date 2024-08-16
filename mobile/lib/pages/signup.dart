import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/theme/theme.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(bgcolor),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              'Quiz App',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'pacifico',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

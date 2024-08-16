import 'package:flutter/material.dart';
import 'package:quizapp/pages/signup.dart';

void main() {
  runApp(const Quiz_App());
}

class Quiz_App extends StatelessWidget {
  const Quiz_App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Signup(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quizapp/pages/start_quiz.dart';
import 'package:quizapp/pages/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  // await prefs.remove('authToken');
  String? authToken = prefs.getString('authToken') ?? "NO_TOKEN";

  print("Token:" + authToken);

  runApp(Quiz_App(token: authToken));
}

class Quiz_App extends StatelessWidget {
  Quiz_App({super.key, required this.token});

  String token;

  @override
  Widget build(BuildContext context) {
    if (token == "NO_TOKEN") {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StartQuiz(),
      );
    }
    else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StartQuiz(),
      );
    }
  }
}

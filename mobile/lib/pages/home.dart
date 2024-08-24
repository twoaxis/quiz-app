import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:quizapp/pages/create_quiz.dart';
import 'package:quizapp/pages/join_quiz.dart';
import 'package:quizapp/pages/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/theme.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  bool isBodyEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(textcolor),
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(Buttoncolor),
              ),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.remove('authToken');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Signup(),
                  ),
                );
              },
              child: Text(
                'Log out',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
      body: isBodyEmpty
          ? Center(
              child: Text(
                'Empty',
              ),
            )
          : Center(
              child: Text(
                'full',
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Color(textcolor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16.0),
              ),
            ),
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JoinQuiz(),
                          ),
                        );
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            'Join Quiz',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateQuiz(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          'Create Quiz',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color(Buttoncolor),
      ),
    );
  }
}

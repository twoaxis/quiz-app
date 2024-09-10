import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/componant/customTextField.dart';
import 'package:quizapp/componant/error.dart';
import 'package:quizapp/pages/home.dart';
import 'package:quizapp/pages/login.dart';
import 'package:quizapp/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String error = '';
  final Dio dio = Dio();

  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(bgcolor),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: deviceHeight * 0.05,
              ),
              Center(
                child: Text(
                  'Quiz App',
                  style: TextStyle(
                    fontSize: deviceWidth * 0.09,
                    fontFamily: 'pacifico',
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.02,
              ),
              Text(
                'Sign up',
                style: TextStyle(
                  fontSize: deviceWidth * 0.1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.01,
              ),
              Text('Create Your Account'),
              SizedBox(
                height: deviceHeight * 0.03,
              ),
              if (error.isNotEmpty)
                Errorwidget(content: error)
              else
                SizedBox(height: deviceHeight * 0.03),
              Customtextfield(
                IsPassword: false,
                image: Icons.person,
                text: 'UserName',
                controller: nameController,
              ),
              SizedBox(
                height: deviceHeight * 0.0001,
              ),
              Customtextfield(
                IsPassword: true,
                image: Icons.password,
                text: 'Password',
                controller: passwordController,
              ),
              SizedBox(
                height: deviceHeight * 0.0001,
              ),
              Customtextfield(
                IsPassword: true,
                image: Icons.password,
                text: 'Confirm Password',
                controller: confirmPasswordController,
              ),
              SizedBox(
                height: deviceHeight * 0.05,
              ),
              SizedBox(
                width: deviceWidth * 0.8,
                height: deviceHeight * 0.06,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(Buttoncolor),
                  ),
                  onPressed: () async {
                    if (nameController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        confirmPasswordController.text.isEmpty) {
                      setState(
                        () {
                          error = "Please fill in all fields";
                        },
                      );
                    } else if (passwordController.text !=
                        confirmPasswordController.text) {
                      setState(() {
                        error = 'Password and Confirm Password must be same';
                      });
                    } else {
                      setState(() {
                        error = '';
                      });

                      try {
                        Response response = await dio.post(
                            'https://api.twoaxis.xyz/quiz-app/auth/signup',
                            data: {
                              'username': nameController.text,
                              'password': passwordController.text
                            });

                        if (response.statusCode == 200) {
                          String token = response.data["token"];

                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setString('authToken', token);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        }
                      } on DioException catch (e) {
                        if (e.response!.statusCode == 409) {
                          setState(() {
                            error = 'Username is taken';
                          });
                        }
                      }
                    }
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: deviceWidth * 0.06,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already Have an Account?   ',
                    style: TextStyle(fontSize: deviceWidth * 0.04),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: deviceWidth * 0.045,
                        color: Color(Buttoncolor),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: deviceHeight * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

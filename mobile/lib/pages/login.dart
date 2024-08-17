import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/pages/home.dart';
import 'package:quizapp/pages/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../componant/customTextField.dart';
import '../componant/error.dart';
import '../theme/theme.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String error = '';

  final Dio dio = Dio();

  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(bgcolor),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                'Quiz App',
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'pacifico',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Enter Your Credential to Login'),
            SizedBox(
              height: 30,
            ),
            error.length > 0
                ? Errorwidget(content: error)
                : SizedBox(height: 0),
            SizedBox(
              height: 28.0,
            ),
            Customtextfield(
              IsPassword: false,
              image: Icons.person,
              text: 'UserName',
              controller: nameController,
            ),
            Customtextfield(
              IsPassword: true,
              image: Icons.password,
              text: 'Password',
              controller: passwordController,
            ),
            SizedBox(
                width: 350,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(Buttoncolor),
                  ),
                  onPressed: () async {
                    if (nameController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      setState(
                        () {
                          error = "Please fill in all fields";
                        },
                      );
                    } else {
                      setState(() {
                        error = '';
                      });
                      try {
                        Response response = await dio.post(
                            'https://api.twoaxis.xyz/quiz-app/auth/login',
                            data: {
                              'username': nameController.text,
                              'password': passwordController.text
                            });
                        if (response.statusCode == 200) {
                          String token = response.data['token'];
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setString('token', token);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        }
                      } on DioException catch (e) {
                        if (e.response!.statusCode == 401) {
                          setState(() {
                            error = 'Username or Password is incorrect';
                          });
                        }
                      }
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )),
            SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Forget Password ?',
                style: TextStyle(color: Color(Buttoncolor), fontSize: 17),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't Have an Account?    ",
                  style: TextStyle(fontSize: 15),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Signup()));
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(fontSize: 18, color: Color(Buttoncolor)),
                  ),
                )
              ],
            ),
          ]),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/componant/customTextField.dart';
import 'package:quizapp/componant/error.dart';
import 'package:quizapp/theme/theme.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String error = '';

  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(bgcolor),
      body: SingleChildScrollView(
        child: Column(
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
            SizedBox(
              height: 20,
            ),
            Text(
              'Sign up',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Create Your Account'),
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
            Customtextfield(
              IsPassword: true,
              image: Icons.password,
              text: 'Confirm Password',
              controller: confirmPasswordController,
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 350,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(Buttoncolor),
                ),
                onPressed: () {
                  if (passwordController.text ==
                      confirmPasswordController.text) {
                    setState(() {
                      error = '';
                    });
                  } else if (passwordController.text !=
                      confirmPasswordController.text) {
                    setState(() {
                      error = 'Password and Confirm Password must be same';
                    });
                  } else {
                    setState(() {});
                  }
                },
                child: Text(
                  'Sign up',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already Have an Account?   ',
                  style: TextStyle(fontSize: 15),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18, color: Color(Buttoncolor)),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

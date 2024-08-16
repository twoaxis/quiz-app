import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/componant/customTextField.dart';
import 'package:quizapp/theme/theme.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

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
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Create Your Account'),
            SizedBox(
              height: 30,
            ),
            Customtextfield(
                IsPassword: false, image: Icons.person, text: 'UserName'),
            Customtextfield(
                IsPassword: true, image: Icons.password, text: 'Password'),
            Customtextfield(
                IsPassword: true,
                image: Icons.password,
                text: 'Confirm Password'),
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
                onPressed: () {},
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

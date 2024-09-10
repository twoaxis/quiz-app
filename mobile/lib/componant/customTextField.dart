import 'package:flutter/material.dart';
import 'package:quizapp/theme/theme.dart';

class Customtextfield extends StatelessWidget {
  Customtextfield({
    required this.IsPassword,
    required this.image,
    required this.text,
    required this.controller,
  });

  String text;
  IconData image;
  bool IsPassword;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: deviceHeight * 0.01, horizontal: deviceWidth * 0.001),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        obscureText: IsPassword,
        decoration: InputDecoration(
          focusColor: Color(Secondarycolor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          fillColor:
              Color(Secondarycolor), // Set your desired background color here
          filled: true, // This needs to be true to apply the background color,
          prefixIcon: Icon(
            image,
            size: deviceWidth * 0.07,
          ),
          label: Text(
            text,
            style: TextStyle(
              fontSize: deviceWidth * 0.045,
            ),
          ),
        ),
      ),
    );
  }
}

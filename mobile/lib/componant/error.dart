import 'package:flutter/material.dart';
import 'package:quizapp/theme/theme.dart';

class Errorwidget extends StatelessWidget {
  Errorwidget({required this.content});

  String content;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Color(Buttoncolor),
            border: Border.all(
              width: 2.0,
              color: Color(Secondarycolor),
            ),
          ),
          child: Text(
            content,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

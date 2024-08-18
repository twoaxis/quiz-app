import 'package:flutter/material.dart';

import '../theme/theme.dart';

class CreateQuiz extends StatelessWidget{
  const CreateQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(textcolor),
        title: Text('Create new quiz' , style: TextStyle(color: Colors.white ,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}

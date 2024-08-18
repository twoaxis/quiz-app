import 'package:flutter/material.dart';
import 'package:quizapp/pages/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(textcolor),
        title: Text('Home' , style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Color(Buttoncolor)),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.remove('authToken');
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Signup(),
                  ),
                  );
                },
                child: Text('Log out' ,
                  style: TextStyle(color: Colors.white),
                ),
            ),
          )
        ],
      ),
      body: Column(
        children: [

        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(Buttoncolor),
        onPressed: (){} , child: Icon(Icons.add , color: Colors.white,),),
    );
  }
}

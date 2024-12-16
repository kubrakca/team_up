import 'package:flutter/material.dart';
import 'SignUpPage.dart';
import 'LogInPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Color customGreen = Color(int.parse('ffd0ec99', radix: 16));

    return Scaffold(
      backgroundColor: customGreen,
      appBar: AppBar(
        backgroundColor: customGreen,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'TeamUp !',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 96,
              fontWeight: FontWeight.normal,
            ),
          ),

          const Text(
                '🏀⚽️🏐',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 48,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 100),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogInPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: customGreen,
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Log In',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.orange,
              ),
            ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: customGreen,
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.orange,
            ),

            ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:team_upp/LogInPage.dart';
import 'package:team_upp/CreateActivity.dart';
import 'package:team_upp/SearchActivity.dart';
import 'package:team_upp/ProfileSettings.dart';

class SearchAndCreatePage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LogInPage()),
      );
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    Color customGreen = Color(int.parse('ffd0ec99', radix: 16));

    return Scaffold(
      backgroundColor: customGreen,
      appBar: AppBar(
        backgroundColor: customGreen,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              _signOut(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle_outlined),
            onPressed: () {
              // Navigate to your profile settings page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileSettings()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'TeamUp',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 80,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateActivity()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: customGreen,
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Create Activity',
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
                  MaterialPageRoute(builder: (context) => SearchActivity()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: customGreen,
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Search Activity',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.orange,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

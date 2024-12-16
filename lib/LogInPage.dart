import 'package:flutter/material.dart';
import 'package:team_upp/SearchAndCreatePage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OvalInputBorder extends OutlineInputBorder {
  const OvalInputBorder({
    BorderSide borderSide = const BorderSide(),
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(12.0)),
  }) : super(borderSide: borderSide, borderRadius: borderRadius);

  @override
  OutlineInputBorder borderRadiuss(BorderRadius borderRadius) {
    return OvalInputBorder(borderRadius: borderRadius);
  }
}

class LogInPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LogInPage({Key? key}) : super(key: key);
  Color customGreen = Color(int.parse('ffd0ec99', radix: 16));

  Future<void> _resetPassword(String email, BuildContext context) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: customGreen,
            title: Text("Success"),
            content: Text("Password reset email sent to $email",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK",
                style: TextStyle(
                color: Colors.orange,
          ),),
              ),
            ],
          );
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Error sending password reset email: $e"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Team Up',
                  style: TextStyle(
                    fontSize: 80,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    text: '🏀⚽️🏐',
                    style: TextStyle(
                      fontSize: 36,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.orange),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OvalInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.orange),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OvalInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                _resetPassword(_emailController.text, context);
              },
              child: Text(
                'Forget Password?',
                style: TextStyle(
                  color: Colors.orange,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  UserCredential userCredential =
                  await _auth.signInWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchAndCreatePage()),
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found' || e.code == 'wrong-password') {
                    print('Invalid email or password');
                  }
                } catch (e) {
                  print(e.toString());
                }
              },
              style: ElevatedButton.styleFrom(
                primary: customGreen,
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Log In !',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

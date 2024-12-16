import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:team_upp/LogInPage.dart';
import 'package:team_upp/SearchAndCreatePage.dart';

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

class SignUpProfileInfoPart extends StatelessWidget {
   SignUpProfileInfoPart({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _sportTypeController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Color customGreen = Color(int.parse('ffd0ec99', radix: 16));

    return Scaffold(
      backgroundColor: customGreen,
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
                    fontSize: 50,
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
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                   controller: _nameController,
                    decoration: InputDecoration(
                     labelText: 'Name',
                      labelStyle: TextStyle(color: Colors.orange),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OvalInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                   controller: _surnameController,
                    decoration: InputDecoration(
                      labelText: 'Surname',
                      labelStyle: TextStyle(color: Colors.orange),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OvalInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _weightController,
              decoration: InputDecoration(
                labelText: 'Weight',
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
            controller: _heightController,
              decoration: InputDecoration(
                labelText: 'Height',
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
             controller: _sportTypeController,
              decoration: InputDecoration(
                labelText: 'Sport Type',
                labelStyle: TextStyle(color: Colors.orange),
                focusedBorder: OvalInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OvalInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
             controller: _positionController,
              decoration: InputDecoration(
                labelText: 'Position',
                labelStyle: TextStyle(color: Colors.orange),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OvalInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
            FirebaseAuth auth=FirebaseAuth.instance;

            FirebaseFirestore.instance.collection('User').doc(auth.currentUser?.uid).set({"email":auth.currentUser?.email, "Name": _nameController.text,
                 'Surname': _surnameController.text,
                 'Weight': _weightController.text,
                 'Height': _heightController.text,
                 'Sport Type': _sportTypeController.text,
                 'Position': _positionController.text,},
                 SetOptions(merge: true)
                );
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchAndCreatePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: customGreen,
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Sign Up !',
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
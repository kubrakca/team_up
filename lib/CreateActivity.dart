import 'package:flutter/material.dart';
import 'package:team_upp/SearchAndCreatePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:team_upp/SearchActivity.dart';


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

class CreateActivity extends StatelessWidget {
  CreateActivity({Key? key});
  final TextEditingController _sportTypeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
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
                    fontSize: 55,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    text: '🏀⚽️🏐',
                    style: TextStyle(
                      fontSize: 35,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _sportTypeController,
              decoration: InputDecoration(
                labelText: 'Sport Type : ',
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
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Date :',
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
              controller: _timeController,
              decoration: InputDecoration(
                labelText: 'Time :',
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
              controller: _locationController,
              decoration: InputDecoration(
                labelText: 'Location : ',
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
            TextFormField(
              controller: _positionController,
              decoration: InputDecoration(
                labelText: 'Needed Position : ',
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
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      FirebaseAuth auth = FirebaseAuth.instance;
                      String ownerId = auth.currentUser?.uid ?? '';

                      DocumentReference activityRef = await FirebaseFirestore.instance.collection('Activity').add({
                        "OwnerEmail": auth.currentUser?.email ?? '',
                        "Name": auth.currentUser?.email,
                        "SportType": _sportTypeController.text,
                        'Date': _dateController.text,
                        'Time': _timeController.text,
                        'Location': _locationController.text,
                        'Position': _positionController.text,

                      });

                      activityRef.update({
                        "OwnerId": ownerId,
                      });

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
                        'Create Activity !',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

class ProfileSettings extends StatelessWidget {
  ProfileSettings({super.key});

  String name = "";
  String surname = "";
  String weight = "";
  String height = "";
  String sportType = "";
  String position = "";

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Color customGreen = Color(int.parse('ffd0ec99', radix: 16));

    return Scaffold(
      backgroundColor: customGreen,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance.collection('User').doc(auth.currentUser?.uid).get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              Map<String, dynamic>? userData = snapshot.data?.data() as Map<String, dynamic>?;

              return ListView(
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
                          onChanged: (value) {
                            name = value;
                          },
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
                          initialValue: userData?['Name'] ?? '',
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          onChanged: (value) {
                            surname = value;
                          },
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
                          initialValue: userData?['Surname'] ?? '',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    onChanged: (value) {
                      weight = value;
                    },
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
                    initialValue: userData?['Weight'] ?? '',
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onChanged: (value) {
                      height = value;
                    },
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
                    initialValue: userData?['Height'] ?? '',
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onChanged: (value) {
                      sportType = value;
                    },
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
                    initialValue: userData?['Sport Type'] ?? '',
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onChanged: (value) {
                      position = value;
                    },
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
                    initialValue: userData?['Position'] ?? '',
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection('User')
                          .doc(auth.currentUser?.uid)
                          .update({
                        "Name": name,
                        "Surname": surname,
                        "Weight": weight,
                        "Height": height,
                        "Sport Type": sportType,
                        "Position": position,
                      });
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: customGreen,
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Save Changes',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

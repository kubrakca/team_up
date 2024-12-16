import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchActivity extends StatefulWidget {
  const SearchActivity({Key? key}) : super(key: key);

  @override
  _SearchActivityState createState() => _SearchActivityState();
}

class _SearchActivityState extends State<SearchActivity> {
  Color customGreen = Color(int.parse('ffd0ec99', radix: 16));
  bool isFirstTime = true;

  @override
  void initState() {
    super.initState();
    _showWelcomeDialog();
  }

  void _showWelcomeDialog() {
    if (isFirstTime) {
      Future.delayed(Duration.zero, () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Welcome!',
              style: TextStyle(
                color: Colors.orange,
              ),

            ),
            content: Text('Here is activity list. Do not forget to send     e-mail to activity owner ! \n'  'Have a nice sport session !'  ,
              style: TextStyle(
                color: Colors.black,
            ),
            ),

            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    isFirstTime = false;
                  });
                },
                child: Text('OK',
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                ),
              ),
            ],
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customGreen,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection('Activity').get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<QueryDocumentSnapshot> activities =
              snapshot.data!.docs.toList();

              return ListView.builder(
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  var activityData = activities[index].data();

                  if (activityData is Map<String, dynamic>) {
                    var activity = activityData as Map<String, dynamic>;

                    return Card(
                      color: Colors.grey[200],
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(activity['Name'] ?? ''),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Sport Type: ${activity['SportType'] ?? ''}'),
                            Text('Date: ${activity['Date'] ?? ''}'),
                            Text('Time: ${activity['Time'] ?? ''}'),
                            Text('Location: ${activity['Location'] ?? ''}'),
                            Text('Position: ${activity['Position'] ?? ''}'),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Text('Error: Data is not of expected type.');
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}

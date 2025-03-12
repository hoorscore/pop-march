import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img4.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Spacer(),
                    Text(
                      "المستخدمين",
                      style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                  ],
                ),
              ),

              // Search Bar
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    hintText: "البحث عن مستخدم...",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),

              // Firestore Fetch Button
              ElevatedButton(
                onPressed: () async {
                  FirebaseFirestore db = FirebaseFirestore.instance;
                  try {
                    var snapshot = await db.collection('users').get();
                    if (snapshot.docs.isNotEmpty) {
                      print('Data fetched from Firestore:');
                      for (var doc in snapshot.docs) {
                        print('${doc.id} => ${doc.data()}');
                      }
                    } else {
                      print('No data available in Firestore.');
                    }
                  } catch (e) {
                    print('Error fetching data from Firestore: $e');
                  }
                },
                child: Text('Fetch Users from Firestore'),
              ),

              // User List
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('users').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    var users = snapshot.data!.docs;

                    return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        var user = users[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  user['email'],
                                  style: TextStyle(fontSize: 16, color: Colors.black),
                                ),
                                Text(
                                  user['name'],
                                  style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.amber,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: 3,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.white), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.checklist, color: Colors.white), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.white), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings, color: Colors.blue), label: ""),
        ],
      ),
    );
  }
}

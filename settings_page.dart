import 'package:flutter/material.dart';
import 'sound_settings.dart';
import 'FAQ.dart';
import 'userslist.dart';  // Ensure this is imported correctly

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int selectedIndex = 3; // Default to settings tab

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    // Navigate to respective pages
    switch (index) {
      case 0:
      // Navigate to home page if you have one
        break;
      case 1:
      // Navigate to checklist page if you have one
        break;
      case 2:
      // Navigate to profile page if you have one
        break;
      case 3:
      // Already in settings, no navigation needed
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img4.jpg"), // Ensure asset exists
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back, color: Colors.white, size: 30),
                    Spacer(),
                    Text(
                      "الإعدادات",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.settings, color: Colors.white, size: 30),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Settings Options
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    settingsOption(context, "تعديل الحساب الشخصي"),
                    settingsOption(context, "تغيير كلمة المرور"),
                    divider(),
                    // Make "الصلاحيات" bold and align it to the right
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Align(
                        alignment: Alignment.centerRight, // Align to the right
                        child: Text(
                          "الصلاحيات",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold), // Bold text
                        ),
                      ),
                    ),
                    settingsOption(context, "تعديل أصوات الخلفية"),
                    settingsOption(context, "تعديل سياسة الخصوصية"),
                    settingsOption(context, "تعديل الشروط والأحكام"),
                    settingsOption(context, "إدارة الأسئلة الشائعة"),
                    settingsOption(context, "عرض بيانات المستخدمين"),
                  ],
                ),
              ),

              // Logout Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: ElevatedButton(
                  onPressed: () {
                    // Add logout logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout, color: Colors.white),
                      SizedBox(width: 8),
                      Text("تسجيل خروج",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ],
                  ),
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
        selectedItemColor: Colors.blue, // Blue for selected item
        unselectedItemColor: Colors.white70,
        currentIndex: selectedIndex, // Track the selected index
        onTap: onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.checklist), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
        ],
      ),
    );
  }

  // Function to create settings option widget (with clickable arrows)
  Widget settingsOption(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          // Handle navigation for interactive options
          if (title == "تعديل أصوات الخلفية") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SoundSettingsPage()),
            );
          } else if (title == "إدارة الأسئلة الشائعة") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FAQPage()),
            );
          } else if (title == "عرض بيانات المستخدمين") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UsersListPage()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Pressed: $title")),
            );
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Only show arrow if the title isn't "الصلاحيات"
            if (title != "الصلاحيات")
              Icon(Icons.arrow_back, color: Colors.white),
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: title == "الصلاحيات" ? FontWeight.normal : FontWeight.bold), // Make "الصلاحيات" normal weight
            ),
          ],
        ),
      ),
    );
  }

  // Divider widget
  Widget divider() {
    return Divider(color: Colors.white, thickness: 1, height: 20);
  }
}

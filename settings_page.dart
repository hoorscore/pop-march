import 'package:flutter/material.dart';
import 'sound_settings.dart';
import 'FAQ.dart';
import 'userslist.dart';  // Ensure this is imported correctly

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img4.jpg"), // Correct asset path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Column(
            children: [
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
                    settingsOption(context, "الصلاحيات"),
                    divider(),
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
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 20),
                child: ElevatedButton(
                  onPressed: () {},
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
                      Icon(Icons.arrow_back, color: Colors.white),
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
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
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
            Icon(Icons.arrow_back, color: Colors.white),
            Text(
              title,
              style: TextStyle(
                  fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
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

import 'package:flutter/material.dart';
import '../auth/home_page.dart';
import 'lms_page.dart';
import 'cbt_page.dart';
import 'attendance_page.dart';
import 'profile_page.dart';
import 'app_them.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    LmsPage(),
    CbtPage(),
    AttendancePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: AppTheme.maroon,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'LMS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'CBT',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Presensi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
import 'credit.dart'; 
import 'reward.dart'; 

import 'play.dart'; 
import 'setting.dart'; 
import '../utils/bottomnav.dart';

class DashboardHome extends StatefulWidget {
  @override
  _DashboardHomeState createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  int _currentIndex = 0;

  void _navigateTo(int index) {
    switch (index) {
      case 0: 
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardHome()),
        );
        break;
      case 1: 
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreditPage()),
        );
        break;
      case 2: 
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RewardPage()),
        );
        break;
      case 3: 
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PlayPage()),
        );
        break;
      case 4: 
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC2D7F1),
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF4E9FE5),
      ),
      bottomNavigationBar: BottomNav(  // Replace this line
        currentIndex: _currentIndex,
        onTabChange: _navigateTo,
      ),
    );
  }
}
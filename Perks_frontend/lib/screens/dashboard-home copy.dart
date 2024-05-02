import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class DashboardHome extends StatefulWidget {
  @override
  _DashboardHomeState createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  int _currentIndex = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC2D7F1),
      appBar: AppBar(
        title: Text(
          'Welcome XXX YYY',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF4E9FE5),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          Center(child: Text('Home')),
          Center(child: Text('Credit')),
          Center(child: Text('Rewards')),
          Center(child: Text('Play')),
          Center(child: Text('Settings')),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        color: Color(0xFF4E9FE5),
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        },
        items: [
          Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.home, size: 28),
            Text('Home', style: TextStyle(fontSize: 10))
          ]),
          Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.attach_money, size: 28),
            Text('Credit', style: TextStyle(fontSize: 10))
          ]),
          Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.card_giftcard, size: 28),
            Text('Rewards', style: TextStyle(fontSize: 10))
          ]),
          Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.leaderboard, size: 29),
            Text('Play', style: TextStyle(fontSize: 10))
          ]),
          Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.settings, size: 28),
            Text('Settings', style: TextStyle(fontSize: 10))
          ]),
        ],
      ),
    );
  }
}

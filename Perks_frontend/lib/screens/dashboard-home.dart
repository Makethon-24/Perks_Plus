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
      appBar: AppBar(
        
        title: Text(
          'Welcome XXX YYY', style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF4E9FE5),
        actions: <Widget>[],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[
          Center(child: Text('Home')),
          Center(child: Text('Credit')),
          Center(child: Text('Rewards')),
          Center(child: Text('Play')),
          Center(child: Text('Settings')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home.png', width: 50, height: 50),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/credit.png', width: 50, height: 50),
            label: 'Credit',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/rewards.png', width: 50, height: 50),
            label: 'Rewards',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/play.png', width: 50, height: 50),
            label: 'Play',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/settings.png', width: 50, height: 50),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
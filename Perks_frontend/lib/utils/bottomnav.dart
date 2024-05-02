import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabChange;

  BottomNav({required this.currentIndex, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Color(0xFF4E9FE5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: GNav(
          selectedIndex: currentIndex,
          color: Colors.white,
          activeColor: Colors.black,
          tabBackgroundColor: Color.fromARGB(255, 249, 249, 250),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          onTabChange: onTabChange,
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.attach_money,
              text: 'Credit',
            ),
            GButton(
              icon: Icons.card_giftcard,
              text: 'Rewards',
            ),
            GButton(
              icon: Icons.leaderboard,
              text: 'Play',
            ),
            GButton(
              icon: Icons.settings,
              text: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'cards.dart';

class TwoFactorAuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC2D7F1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 90),
            Image.asset('assets/images/OTP.png', height: 200.0, width: 200.0),
            Text(
              'Enter verification code',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 30),
            Text(
              'Your verification code has been sent to your email address',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Image.asset('assets/images/dum.png', height: 90.0, width: 600.0),
            GestureDetector(
              onTap: () {
                // verification action here
              },
              child: Container(
                width: 200,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    'Verify',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CardsPage()),
                );
              },
              child: Container(
                width: 200,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

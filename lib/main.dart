import 'package:flutter/material.dart';
import 'screens/start-page.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perks Plus',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartPage(), 
    );
  }
}
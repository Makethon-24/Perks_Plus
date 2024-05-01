import 'package:flutter/material.dart';

import 'dashboard-home.dart';

class CardsPage extends StatefulWidget {
  @override
  _CardsPageState createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  List<String> images = [
    'assets/images/card1.png',
    'assets/images/card2.png',
    'assets/images/card3.png',
  ];

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  void loadMoreCards() {
    setState(() {
     
      images.addAll(['assets/images/card4.jpeg', 'assets/images/card5.png', 'assets/images/card6.png', 'assets/images/card7.png', 'assets/images/card8.png']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(30),
            color: Colors.blue,
            child: Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                greeting(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardHome()), 
                  );
                    },
                    child: Container(
                      height: 220,
                      child: Card(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (images.length < 50)
            Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: 150,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 147, 182, 210), 
                      borderRadius: BorderRadius.circular(
                          100),
                    ),
                    child: TextButton(
                      onPressed: loadMoreCards,
                      child: Text(
                        'Show More',
                        style: TextStyle(
                          color: Colors
                              .white, 
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

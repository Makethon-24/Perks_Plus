import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'login.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC2D7F1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 2),
            Image.asset('assets/images/start-page.png'),
            Spacer(flex: 1),
            Text(
              'Get personalized rewards, AI insights, and exclusive features that transform your loyalty experience.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 70.0),
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 60.0,
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.black)))),
              child: Text('Get Started',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NextPage()));
              },
            ),
          ),
        ),
      ),
    );
  }
}

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  final controller = PageController(viewportFraction: 1);
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      int nextPage = controller.page?.round() ?? 0;
      if (nextPage != currentPageIndex) {
        setState(() {
          currentPageIndex = nextPage;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC2D7F1),
      body: Stack(
        children: <Widget>[
          PageView(
            controller: controller,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      'Gain customized rewards and insights',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'KaiseiOpti',
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 50.0),
                      child: Image.asset('assets/images/cascade1.png',
                          width: 200.0, height: 200.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Colors.black,
                        dotColor: Colors.white,
                        dotHeight: 8.0,
                        dotWidth: 8.0,
                        expansionFactor: 2,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      'Play and win credit points',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'KaiseiOpti',
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 50.0),
                      child: Image.asset('assets/images/cascade2.png',
                          width: 200.0, height: 200.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        activeDotColor: const Color.fromARGB(255, 63, 35, 35),
                        dotColor: Colors.white,
                        dotHeight: 8.0,
                        dotWidth: 8.0,
                        expansionFactor: 2,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      'Browse transactions and offers using a calendar',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'KaiseiOpti',
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 60.0),
                      child: Image.asset('assets/images/cascade3.png',
                          width: 200.0, height: 200.0),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Colors.black,
                      dotColor: Colors.white,
                      dotHeight: 8.0,
                      dotWidth: 8.0,
                      expansionFactor: 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (currentPageIndex == 2)
            Positioned(
              right: 30.0,
              bottom: 50.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Icon(Icons.arrow_forward, size: 30.0),
              ),
            ),
        ],
      ),
    );
  }
}

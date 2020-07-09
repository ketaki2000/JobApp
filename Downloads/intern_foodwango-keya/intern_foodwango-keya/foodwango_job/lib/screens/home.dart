import 'package:flutter/material.dart';
import 'package:foodwango_job/screens/account.dart';
import 'package:foodwango_job/screens/interview.dart';

import 'account.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String val = "false";
  bool pop;

  @override
  Widget build(BuildContext context) {
    int next = 0;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Foodwagon",
          style: TextStyle(fontSize: 18.0),
        ),
        backgroundColor: Color(0xFF21BFBD),
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF21BFBD),
        unselectedItemColor: Colors.black,
        currentIndex: next,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            backgroundColor: Color(0xFF21BFBD),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
              backgroundColor: Color(0xFF21BFBD)),

          BottomNavigationBarItem(
              icon: Icon(Icons.lightbulb_outline),
              title: Text('Interview Tips'),
              backgroundColor: Color(0xFF21BFBD)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('My Account'),
              backgroundColor: Color(0xFF21BFBD)),

        ],
        onTap: (int index) {
          setState(() async {
            next = index;
            if (next == 2) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Interview();
              }));
            }
            if (next == 3) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Account();
              }));
            }
          });
        },
      ),
    );
  }
}

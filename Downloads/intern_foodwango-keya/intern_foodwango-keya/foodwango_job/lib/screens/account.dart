import 'package:flutter/material.dart';
import 'package:foodwango_job/screens/profile.dart';
import 'package:foodwango_job/services/auth.dart';

import '../main.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final Authservice _auth = Authservice();

  List details = ['Profile', 'My Jobs', 'Log out'];
  bool pop;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('My Account'),
          backgroundColor: Color(0xFF21BFBD),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.person),
              title: Text('My Profile'),
              trailing: Icon(Icons.navigate_next),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Profile();
                }));
              },
            ),
            jobs(),
            GestureDetector(
                onTap: () {
                  _auth.signOut();
                  signout();
                },
                child: ListTile(
                  leading: Icon(Icons.play_circle_outline),
                  title: Text('Logout'),
                  trailing: Icon(Icons.navigate_next),
                )),
          ],
        ));
  }

  Widget jobs() {
    return ListTile(
      leading: Icon(Icons.work),
      title: Text('My Jobs'),
      trailing: Icon(Icons.navigate_next),
    );
  }

  signout() {
    
      Navigator.popUntil(context,ModalRoute.withName('/'));
    
  }
}

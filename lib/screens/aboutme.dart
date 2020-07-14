import 'package:flutter/material.dart';
import 'package:foodwango_job/models/SeekerDb.dart';
import 'package:foodwango_job/screens/profile.dart';

class AboutMe extends StatefulWidget {
  final User userDb;
  AboutMe({Key key, @required this.userDb}) : super(key: key);
  @override
  _AboutMeState createState() => _AboutMeState(userDb: userDb);
}

class _AboutMeState extends State<AboutMe> {
  final User userDb;

  _AboutMeState({Key key,@required this.userDb}):super();


  @override
  Widget build(BuildContext context) {
    TextEditingController describe = new TextEditingController();
    describe.text = userDb.aboutMe;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('About Me'),
        backgroundColor: Color(0xFF21BFBD),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: describe,
            decoration: InputDecoration(hintText: 'Describe Yourself'),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: RaisedButton(
              elevation: 6,
              child: Text('SAVE'),
              color: Color(0xFF21BFBD),
              onPressed: () {
                userDb.aboutMe=describe.text;
                /*Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Profile();
                }));*/
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}

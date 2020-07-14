import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:foodwango_job/models/SeekerDb.dart';
import 'package:foodwango_job/screens/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodwango_job/screens/profile.dart';

class Education extends StatefulWidget {
  final User userDb;
  Education({Key key, @required this.userDb}) : super(key: key);
  @override
  EducationState createState() => EducationState(userDb: userDb);
}

class EducationState extends State<Education> {
  DateTime dateSch = new DateTime.now();
  DateTime dateColg = new DateTime.now();
  User userDb;

  EducationState({Key key,@required this.userDb}):super();

  @override
  Widget build(BuildContext context) {
    TextEditingController schoolName = TextEditingController();
    schoolName.text = userDb.schoolName;
    TextEditingController colgName = TextEditingController();
    colgName.text = userDb.collegeName;
    TextEditingController colgDegree = TextEditingController();
    colgDegree.text = userDb.collegeDegree;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Education & Qualification'),
          backgroundColor: Color(0xFF21BFBD),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                'My Qualification',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Center(
                child: Gender(userDb: userDb,),
              ),
            ),
            Text(
              'How I Speak English',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0),
            ),
            Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Center(
                  child: English(userDb: userDb,),
                )),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                'School Information',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Enter School Name'),
                    controller: schoolName,
                  ),
                  new FlatButton(
                    child: new Row(
                      children: <Widget>[
                        new Text(
                          '${formatDate(dateSch, [
                                dd,
                                '/',
                                mm,
                                '/',
                                yyyy
                              ]) + "  "}',
                          style: new TextStyle(
                              color: Color(0xFF21BFBD), fontSize: 15),
                        ),
                        new Icon(Icons.calendar_today),
                        new Text(
                          'Enter End Year',
                          style: TextStyle(fontSize: 10.0),
                          textAlign: TextAlign.right,
                        )
                      ],
                    ),
                    onPressed: () async {
                      final dtPick = await showDatePicker(
                          context: context,
                          initialDate: dateSch,
                          firstDate: DateTime(DateTime.now().year - 20),
                          lastDate: DateTime(DateTime.now().year + 10));
                      if (dtPick != null) {
                        setState(() {
                          dateSch = dtPick;
                        });
                      }
                    },
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10, top: 10),
              child: Text(
                'College Information',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration:
                        InputDecoration(labelText: 'Enter College Name'),
                    controller: colgName,
                  ),
                  TextField(
                    controller: colgDegree,
                    decoration:
                        InputDecoration(labelText: 'Enter College Degree'),
                  ),
                  new FlatButton(
                    child: new Row(
                      children: <Widget>[
                        new Text(
                          '${formatDate(dateColg, [
                                dd,
                                '/',
                                mm,
                                '/',
                                yyyy
                              ]) + "  "}',
                          style: new TextStyle(
                              color: Color(0xFF21BFBD), fontSize: 15),
                        ),
                        new Icon(Icons.calendar_today),
                        new Text(
                          'Enter End Year',
                          style: TextStyle(fontSize: 10.0),
                          textAlign: TextAlign.right,
                        )
                      ],
                    ),
                    onPressed: () async {
                      final dtPick = await showDatePicker(
                          context: context,
                          initialDate: dateColg,
                          firstDate: DateTime(DateTime.now().year - 20),
                          lastDate: DateTime(DateTime.now().year + 10));
                      if (dtPick != null) {
                        setState(() {
                          dateColg = dtPick;
                        });
                      }
                    },
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(top: 30.0),
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      userDb.collegeDegree=colgDegree.text;
                      userDb.collegeName=colgName.text;
                      userDb.schoolName=schoolName.text;
                      userDb.schoolDate=dateSch;
                      userDb.collegeDate=dateColg;
                      /* Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Profile();
                      }));*/
                      Navigator.pop(context);
                    });
                  },
                  color: Color(0xFF21BFBD),
                  child: Text(
                    'SAVE',
                  ),
                  elevation: 6.0,
                ),
              ),
            )
          ],
        ));
  }
}

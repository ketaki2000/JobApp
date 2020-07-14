import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodwango_job/models/SeekerDb.dart';
import 'package:foodwango_job/screens/info.dart';
import 'package:foodwango_job/screens/profile.dart';

class Personal extends StatefulWidget {
  final User userDb;
  Personal({Key key, @required this.userDb}) : super(key: key);
  @override
  PersonalState createState() => PersonalState(userDb:userDb);
}

class PersonalState extends State<Personal> {
  DateTime dateB = new DateTime.now();
  final User userDb;
  PersonalState({Key key, @required this.userDb}):super();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextEditingController name = TextEditingController();
    name.text=userDb.name;
    TextEditingController mobile = TextEditingController();
    mobile.text=userDb.mobile;
    TextEditingController email = TextEditingController();
    email.text=userDb.email;
    TextEditingController languages = TextEditingController();
    languages.text=userDb.languages as String;

    return Scaffold(
        appBar: AppBar(
          title: Text('Personal Information'),
          backgroundColor: Color(0xFF21BFBD),
        ),
        body: ListView(
          children: <Widget>[
            TextField(
              controller: name,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
              keyboardType: TextInputType.number,
              controller: mobile,
              decoration: InputDecoration(labelText: 'Mobile Number'),
            ),
            TextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email-ID'),
            ),
            /*TextField(
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Age'),
            ),*/
            TextField(
              controller: languages,
              decoration: InputDecoration(labelText: 'Languages Known'),
            ),
            new FlatButton(
              child: new Row(
                children: <Widget>[
                  new Text(
                    '${formatDate(dateB, [dd, '/', mm, '/', yyyy]) + "  "}',
                    style:
                        new TextStyle(color: Color(0xFF21BFBD), fontSize: 20),
                  ),
                  new Icon(Icons.calendar_today),
                  new Text(
                    'Enter Birth Year',
                    style: TextStyle(fontSize: 10.0),
                    textAlign: TextAlign.right,
                  )
                ],
              ),
              onPressed: () async {
                final dtPick = await showDatePicker(
                    context: context,
                    initialDate: dateB,
                    firstDate: DateTime(DateTime.now().year - 35),
                    lastDate: DateTime(DateTime.now().year + 10));
                if (dtPick != null) {
                  setState(() {
                    dateB = dtPick;
                  });
                }
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                'My Gender',
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Center(child: Education(userDb: userDb,))),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(top: 30.0),
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      userDb.languages=languages as List;
                      userDb.email=email.text;
                      userDb.mobile=mobile.text;
                      userDb.name=name.text;
                      userDb.dob=dateB;
                      /*Navigator.push(context,
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

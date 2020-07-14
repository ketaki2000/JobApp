import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodwango_job/models/SeekerDb.dart';

class RecruiterHome extends StatefulWidget {
  final Recruiter recDb;

  RecruiterHome({Key key, @required this.recDb}) : super(key: key);

  @override
  _RecruiterHomeState createState() => _RecruiterHomeState(recDb: recDb);
}

class _RecruiterHomeState extends State<RecruiterHome> {
  final Recruiter recDb;

  _RecruiterHomeState({Key key, @required this.recDb}) : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Foodwagon'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Submit'),
          onPressed: ()async{
            final CollectionReference userCollection =
            Firestore.instance.collection('users');
            await userCollection
                .document(recDb.uid).setData(recDb.build(context).toJson());
          },
        ),
      ),
    );

  }
}

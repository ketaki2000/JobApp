import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodwango_job/models/SeekerDb.dart';
import 'package:foodwango_job/screens/recruiter.dart';

class DatabaseService {
   String uid;
final User userDb;

  DatabaseService({Key key, @required this.userDb,this.uid}) : super();

  final CollectionReference userCollection =
      Firestore.instance.collection('users');
  /*Future uect,Suid,String email) async {
    return await userCollection
        .document(uid)
        .setData({'select': select, 'uid': uid,'email':email});
    //.setData(userDb.toJson());
  }*/
  Future updateUserData(String select) async {
    return await userCollection
        .document(uid)
        .setData({'select': select, 'uid': uid,});
  }

  //Stream
  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }
}

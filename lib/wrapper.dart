import 'package:flutter/material.dart';
import 'package:foodwango_job/main.dart';
import 'package:provider/provider.dart';
import 'package:foodwango_job/models/SeekerDb.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodwango_job/services/database.dart';
import 'package:foodwango_job/temp.dart';

import 'screens/login_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return MyHomePage();
    } else {
      return StreamProvider<QuerySnapshot>.value(
          value: DatabaseService().users,
          child: Temp(
            id: user.uid,
          ));

    }
  }
}

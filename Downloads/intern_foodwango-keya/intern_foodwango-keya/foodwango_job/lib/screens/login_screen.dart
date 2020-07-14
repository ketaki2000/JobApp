import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodwango_job/models/SeekerDb.dart';
import 'package:foodwango_job/screens/home.dart';
import 'package:foodwango_job/screens/homepro.dart';
import 'package:foodwango_job/screens/homescreen.dart';
import 'package:foodwango_job/screens/registration_screen.dart';
import 'package:foodwango_job/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  final User userDb;

  LoginScreen({Key key, @required this.userDb}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState(userDb: userDb);
}

class _LoginScreenState extends State<LoginScreen> {
  final User userDb;

  _LoginScreenState({Key key, @required this.userDb}) : super();
  TextEditingController emailControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();
  String name;
  String error = '';
  bool showSpinner = false;
  final Authservice _auth = Authservice();
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
String userType;
  String seekerType;


  _loginUser(String email, String password, BuildContext context) async {
    User _currentUser = Provider.of<User>(context,listen: false);
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;
    StreamBuilder(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
         userType = snapshot.data.documents[uid]['userType'];
         seekerType = snapshot.data.documents[0]['seekerType'];
         return Container();
      },
    );
    //var userType = Text(snapshot.data.documents[0]['userType']);
    try {
      print('trying!!!');
      if (await _currentUser.Login(email, password)) {
        print('trying 2!!!');
        print('th $userType'); // this is null
        if (userType == 'Job Seeker') {
          print('trying 3!!!');
          if (seekerType == 'Normal User') {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Home(
                      userDb: userDb,
                    )));
          }
          if (seekerType == 'Pro User') {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Homepro(
                      userDb: userDb,
                    )));
          }
        }
        if (userType == 'Job Recruiter') {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => homescreen()));
        }
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Incorrect Email or Password'),
          duration: Duration(seconds: 2),
        ));
      }
    } catch (e) {
      print(e);
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Incorrect Email or Password'),
        duration: Duration(seconds: 2),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<User>(
            create: (context) {
              return User();
            },
          ),
        ],
        child: Builder(builder: (BuildContext context) {
          BuildContext rootContext = context;
          return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: EdgeInsets.fromLTRB(30, 50, 30, 10),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/foodwagon.png"),
                            //fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text('Log In',
                          style: TextStyle(
                            color: Color(0xFF21BFBD),
                            fontSize: 30.0,
                          )),
                      SizedBox(
                        height: 48.0,
                      ),
                      TextFormField(
                          controller: emailControl,
                          validator: (val) =>
                              val.isEmpty ? 'Enter an email' : null,
                          //style: kTextStyle,
                          style: TextStyle(color: Colors.black),
                          //textAlign: TextAlign.center,
                          keyboardType: TextInputType.emailAddress,
                          /*onChanged: (value) {
                      email = value;
                      //Do something with the user input.
                    },*/
                          decoration: InputDecoration(
                              labelText: 'email',
                              icon: Icon(
                                Icons.email,
                                color: Color(0xFF21BFBD),
                              ),
                              labelStyle: TextStyle(color: Colors.black),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF21BFBD))))),
                      SizedBox(
                        height: 50.0,
                      ),
                      TextFormField(
                        controller: passwordControl,
                        validator: (val) => val.length < 6
                            ? 'Enter a password 6+character'
                            : null,
                        //style: kTextStyle,
                        obscureText: true,
                        style: TextStyle(color: Colors.black),
                        //textAlign: TextAlign.center,
                        /*onChanged: (value) {
                    //Do something with the user input.
                    password = value;
                  },*/
                        decoration: InputDecoration(
                            labelText: 'Password',
                            icon: Icon(
                              Icons.vpn_key,
                              color: Color(0xFF21BFBD),
                            ),
                            labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF21BFBD)))),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      RaisedButton(
                        child: Text('Log In'),
                        color: Color(0xFF21BFBD),
                        /*onPressed: () async {
                    print(email);
                    print(password);
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final newUser =
                            await _auth.signInWithEmail(email, password);
                        if (newUser == null) {
                          //Navigator.pushNamed(context, ChatScreen.id);
                          //print('cant register');
                          setState(() {
                            error =
                                'Cannot register with given email and password';
                          });
                        } else {
                          Navigator.pop(context);
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        print(e);
                      }
                    }
                  },*/
                        onPressed: () {
                          _loginUser(
                              emailControl.text, passwordControl.text, context);
                        },
                      ),
                      SizedBox(height: 8.0),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          'Dont have an account ?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.0,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => RegistrationScreen()));
                        },
                        child: Text('Sign up here',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 15.0,
                              letterSpacing: 1.0,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:foodwango_job/screens/homescreen.dart';
import 'package:foodwango_job/screens/info.dart';
import 'package:foodwango_job/services/auth.dart';
import 'package:foodwango_job/utils/database_helper.dart';
import 'package:foodwango_job/models/SeekerDb.dart';
import 'package:provider/provider.dart';
class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController passwordController = TextEditingController();


  String error = '';
  bool showSpinner = false;
  List position = ["Job Seeker", "Job Recruiter"];
  String select;
  final Authservice _auth = Authservice();
  final _formKey = GlobalKey<FormState>();
  String name, email, password;
  final User userDb=new User();
final Recruiter recDb = new Recruiter();

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Colors.black,
          value: position[btnValue],
          groupValue: select,
          onChanged: (value) {
            setState(() {
              print(value);
              select = value;
            });
          },
        ),
        Text(title, style: TextStyle(color: Colors.black)),
      ],
    );
  }
/*
  void _signUpUser(String email, String password, BuildContext context) async {
    User _currentUser = Provider.of<User>(context, listen: false);
    try {
      if (select == 'Job Seeker') {
        Navigator.popUntil(context, ModalRoute.withName('/'));
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return info();
        }));
      }
      if (select == 'Job Recruiter') {
        //Navigator.pushNamedAndRemoveUntil(context,"/homescreen",ModalRoute.withName('/') );
        Navigator.popUntil(context, ModalRoute.withName('/'));
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return homescreen();
        }));
      }
      ;
      /*if(await _currentUser.signUp(email, password)){
        Navigator.pop(context);
      }*/
    } catch (e) {
      print(e);
    }
  }

  _sendToServer() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    var data = {"name": name, "seekerOrRecruiter": select};
    ref.child(nameController.toString()).push().set(data);
  }*/

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<User>(
        create: (context){
          return User();
        },
      ),],
      child: Builder(builder: (BuildContext context){
        BuildContext rootContext = context;
        return Scaffold(
//Here to use rootContext is safe
//Provider.of<SomeModel>(rootContext, listen: false);
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
                    SizedBox(
                      height: 40,
                    ),
                    Text('Register',
                        style: TextStyle(
                          color: Color(0xFF21BFBD),
                          fontSize: 30.0,
                        )),
                    SizedBox(
                      height: 48.0,
                    ),
                    TextFormField(
                        controller: emailController,
                        validator: (val) => val.isEmpty ? 'Enter an email' : null,
                        //style: kTextStyle,
                        style: TextStyle(color: Colors.black),
                        //textAlign: TextAlign.center,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          email = value;
                          userDb.email=emailController.text;
                          //Do something with the user input.
                        },
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
                                borderSide: BorderSide(color: Color(0xFF21BFBD))))),
                    SizedBox(
                      height: 50.0,
                    ),
                    TextFormField(
                      controller: nameController,
                      validator: (val) => val.isEmpty ? 'Enter your name' : null,
                      //style: kTextStyle,
                      //textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        name = value;
                        userDb.name=nameController.text;
                        recDb.name=nameController.text;
                        //Do something with the user input.
                      },
                      decoration: InputDecoration(
                          labelText: 'Name',
                          icon: Icon(
                            Icons.person,
                            color: Color(0xFF21BFBD),
                          ),
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF21BFBD)))),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    TextFormField(
                      controller: passwordController,
                      validator: (val) =>
                      val.length < 6 ? 'Enter a password 6+character' : null,
                      //style: kTextStyle,
                      obscureText: true,
                      style: TextStyle(color: Colors.black),
                      //textAlign: TextAlign.center,
                      onChanged: (value) {
                        //Do something with the user input.
                        password = value;
                      },
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
                              borderSide: BorderSide(color: Color(0xFF21BFBD)))),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Are you a?? ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                              fontSize: 16.0),
                        ),
                        Column(
                          children: <Widget>[
                            addRadioButton(0, "Job Seeker"),
                            addRadioButton(1, "Job Recruiter"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    RaisedButton(
                      child: Text('Register'),
                      color: Color(0xFF21BFBD),
                      onPressed: () async {
                        userDb.userType=select;
                        recDb.userType=select;
                        print(userDb.userType);
                        /*int i = await DatabaseHelper.instance
                        .insert({DatabaseHelper.colUserType: '$select'});
                    print(i);*/
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            showSpinner = true;
                          });
                          try {
                            final newUser = await _auth.regInWithEmail(
                                email, password, name, select);
                            if (newUser == null) {
                              //Navigator.pushNamed(context, ChatScreen.id);
                              //print('cant register');
                              setState(() {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text('Cannot register with given email and password'),
                                  duration: Duration(seconds: 2),
                                ));
                                error =
                                'Cannot register with given email and password';
                              });
                            } else if (select == 'Job Seeker') {
/*
                          userDb.userType='Job Seeker';
                          print(userDb.userType);*/
                              Navigator.popUntil(context, ModalRoute.withName('/'));
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return info(userDb: userDb);
                                  }));
                            } else if (select == 'Job Recruiter') {
                              userDb.userType=select;
                              //Navigator.pushNamedAndRemoveUntil(context,"/homescreen",ModalRoute.withName('/') );
                              Navigator.popUntil(context, ModalRoute.withName('/'));
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return homescreen(recDb:recDb);
                                  }));
                            }
                            ;

                            setState(() {
                              showSpinner = false;
                            });
                          } catch (e) {
                            print(e);
                          }
                        }
                      }, /*
                  onPressed: (){
                   // _sendToServer();
                    _signUpUser(emailController.text,passwordController.text,context);


                  },*/
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
    return Scaffold(

    );
  }
}

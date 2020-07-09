import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class User extends ChangeNotifier {
  String uid;
  String _email;
  String get getUid => uid;
  String get getEmail => _email;

  FirebaseAuth _auth= FirebaseAuth.instance;
  Future<bool> signUp(String email,String password) async{
    bool retVal=false;
    try{
      AuthResult _authResult= await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if(_authResult.user!=null){
        retVal=true;
      }
    }catch(e){
      print(e);
    }
    return retVal;
  }
  Future<bool> Login(String email,String password)async{
    bool retVal=false;
    try{
      AuthResult _authResult= await _auth.signInWithEmailAndPassword(email: email, password: password);
      if(_authResult.user!=null){
        retVal=true;
        uid= _authResult.user.uid;

        _email=_authResult.user.email;
      }
    }catch(e){
      print(e);
    }
    return retVal;
  }
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  User({this.uid});
}

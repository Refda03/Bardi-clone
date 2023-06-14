import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationService{
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  getUserData(){
    String userData = _firebaseAuth.currentUser.toString();
    print("Data : "+userData);
    return userData;
  }
  getEmail(){
    var user = _firebaseAuth.currentUser;
    String? email =user?.email.toString();
    print("Email :"+email!);
    return email;
  }

  Future<bool>signOut() async{
    try{
      await _firebaseAuth.signOut();
      return true;
    }on FirebaseAuthException catch(e){
      debugPrint(e.message ?? "Unknown Error");
      return false;
    }
  }

  Future<bool> signIn({required String email,required String password}) async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      getUserData();
      return true;
    }on FirebaseAuthException catch(e){
      debugPrint(e.message ?? "Unknown Error");
      return false;
    }
  }

  Future<bool> signUp({required String email,required String password}) async{
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    }on FirebaseAuthException catch(e){
      debugPrint(e.message ?? "Unknown Error");
      return false;
    }
  }


}
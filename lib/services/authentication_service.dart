import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:night_life/models/user.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<User> get user {
    return _firebaseAuth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFirebaseUser(user));
  }

  //users login with email and password
  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try{
      AuthResult authResult = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = authResult.user;
      return _userFromFirebaseUser(user);
    } catch (e){
      print(e.toString());
      return null;
    }
  }

  //users sign up with email and password
  Future signUpWithEmail({
    @required String email,
    @required String password,
    @required String firstName,
    @required String lastName,
    @required String age
  }) async {
    try{
      AuthResult authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = authResult.user;

      Firestore.instance.collection('users').document().setData({
        'id': authResult.user.uid,
        'first_name': firstName,
        'last_name': lastName,
        'email': authResult.user.email,
        'age': age
      });

      return _userFromFirebaseUser(user);
    } catch (e){
      print(e.toString());
      return null;
    }
  }

  //users sign out
  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e){
      print(e.toString());
      return null;
    }
  }
}

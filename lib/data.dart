
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luminolium_store/login_screen.dart';
import 'package:luminolium_store/main_screen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final User? user = context.watch<User?>();
    if (user == null) {
      return LoginScreen();
    } else {
      return MainScreen(user);
    }
  }
}

class AuthenticationService {
  final FirebaseAuth _auth;

  AuthenticationService(this._auth);

  Stream<User?> get authStateChanged => _auth.authStateChanges();

  Future signIn({email, password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return 'succes';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signInAno() async {
    try {
      await _auth.signInAnonymously();
      return 'signed in';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signUp({ email, password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return 'Succes';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future updateProfile({displayName, photoURL}) async {
    User? user = _auth.currentUser;
    try {
      await user!.updateProfile(
          displayName: displayName,
          photoURL: photoURL);
      return "updated";
    } on FirebaseAuthException catch(e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

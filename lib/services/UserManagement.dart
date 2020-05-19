import 'package:e_learning_volkeno/HomeScreen.dart';
import 'package:e_learning_volkeno/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_learning_volkeno/user.dart';
import 'package:flutter/material.dart';


class UserManagement {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // authentification change user stream
  Stream<User> get user {
    return _firebaseAuth.onAuthStateChanged
        .map((FirebaseUser user) => _UserFromFirebaseUser(user));
  }

// Conversion firebaseUser en User du modele
  User _UserFromFirebaseUser(FirebaseUser firebaseUser) {
    return firebaseUser != null ? User(uid: firebaseUser.uid) : null;
  }

  // méthode d'inscription de l'user
  Future registerUser(String email, String password, String fullname) async {
    try {
      AuthResult _result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser firebaseUser = _result.user;

      // inscription data
      await DatabaseService(uid: firebaseUser.uid).updateUserDataOrCreate(fullname, email);
      return _UserFromFirebaseUser(firebaseUser);
      
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // méthode de connexion user
  Future signInUser(String email, String password) async {
    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      return _UserFromFirebaseUser(user);
      

    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // méthode de déconnexionn User
  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}

// class User {
//   final String uid;
//   User({
//     this.uid
//   });
// }

// class UserData {
//   final String fullname;
//   final String uid;
//   final String email;

//   UserData({
//     this.fullname,
//     this.uid,
//     this.email
//   });
// }

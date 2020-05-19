import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_volkeno/HomeScreen.dart';
import 'package:e_learning_volkeno/LoadControl.dart';
import 'package:e_learning_volkeno/LoginScreen.dart';
import 'package:e_learning_volkeno/LogoImageAsset.dart';
import 'package:e_learning_volkeno/services/UserManagement.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  UserManagement firebaseService = UserManagement();
  //Collection Utilisteur depuis firestore
  final CollectionReference collectionUser = Firestore.instance.collection("users");

  String email;
  String fullname;
  String password;
  String confirmPassword;
  final key = GlobalKey<FormState>();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            //resizeToAvoidBottomPadding: false,
            body: SingleChildScrollView(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: Form(
                key: key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: <Widget>[
                        SizedBox(height: 30),
                        LogoImageAsset(),
                        Center(
                          child: Text(
                            "Inscrivez-vous",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF52ccb9),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Veuillez renseigner ce champs";
                            } else
                              return null;
                          },
                          onChanged: (value) => fullname = value,
                          decoration: InputDecoration(
                            labelText: "Prénom",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 16.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: Color(0xFF52ccb9)),
                            ),
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          validator: (value) {
                            if (!EmailValidator.validate(value)) {
                              return "Format d'adresse mail invalide";
                            } else if (value.isEmpty) {
                              return "Veuillez renseigner ce champs";
                            } else
                              return null;
                          },
                          onChanged: (value) => email = value,
                          decoration: InputDecoration(
                            labelText: "Adresse mail",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 16.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: Color(0xFF52ccb9)),
                            ),
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          validator: (value) {
                            int len = value.length;
                            if (value.isEmpty) {
                              return "Veuillez renseigner ce champs";
                            } else if (len < 6) {
                              return "Un mot de passe doit contenir au minimum 6 caractères";
                            } else
                              return null;
                          },
                          onChanged: (value) => password = value,
                          decoration: InputDecoration(
                            labelText: "Mot de passe",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 16.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: Color(0xFF52ccb9)),
                            ),
                            prefixIcon: Icon(Icons.lock),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          validator: (value) {
                            int len = value.length;
                            if (value.isEmpty) {
                              return "Veuillez renseigner ce champs";
                            } else if (len < 6) {
                              return "Un mot de passe doit contenir au minimum 6 caractères";
                            } else if (confirmPassword != password) {
                              return "Les mots de passe ne correspondent pas";
                            } else
                              return null;
                          },
                          onChanged: (value) => confirmPassword = value,
                          decoration: InputDecoration(
                              labelText: "Confirmer mot de passe",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 16.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide:
                                    BorderSide(color: Color(0xFF52ccb9)),
                              ),
                              prefixIcon: Icon(Icons.lock)),
                          obscureText: true,
                        ),
                        SizedBox(height: 30),
                        GestureDetector(
                          onTap: () async {
                            if (key.currentState.validate()) {
                              key.currentState.save();
                              dynamic resultat = await firebaseService
                                  .registerUser(email, password, fullname);

                              if (resultat != null) {
                               Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                return LoginScreen();
                                  }));
                              }
                            }
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(0xFF52ccb9),
                            ),
                            child: Center(
                              child: Text(
                                "S'inscrire",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        Container(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Déjà inscrit ? "),
                                GestureDetector(
                                  child: Text(
                                    "Se connecter",
                                    style: TextStyle(
                                        color: Color(0xFF52ccb9),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () {
                                    //widget.changeView();
                                    Navigator.of(context).pushNamed("/loginpage");
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}

import 'dart:math';

import 'package:e_learning_volkeno/HomeScreen.dart';
import 'package:e_learning_volkeno/LoadControl.dart';
import 'package:e_learning_volkeno/LogoImageAsset.dart';
import 'package:e_learning_volkeno/services/UserManagement.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserManagement userManagement = UserManagement();

  String email;
  String password;
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
                        SizedBox(height: 20),
                        LogoImageAsset(),
                        SizedBox(height: 30),
                        Center(
                          child: Text(
                            "Connectez-vous",
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
                            } else if (!EmailValidator.validate(value)) {
                              return "Format d'adresse email invalide";
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
                              return "Mot de passe trop petit";
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
                        SizedBox(height: 10),
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  "Mot de passe oublié ?",
                                  style:
                                      TextStyle(color: Colors.lightBlueAccent),
                                ),
                              ]),
                        ),
                        SizedBox(height: 30),
                        FlatButton(
                          onPressed: () async {
                            if (key.currentState.validate()) {
                              // setState(() {
                              //   loading = true;
                              // });
                              try {
                                AuthResult result = await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: email, password: password);
                                FirebaseUser user = result.user;

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HomeScreen(user: user)));
                              } catch (e) {
                                print(e.toString());
                                return null;
                              }
                            }
                          },
                          color: Color(0xFF52ccb9),
                          child: Text("Se connecter"),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        SizedBox(height: 70),
                        Container(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Pas encore de compte ? "),
                                GestureDetector(
                                  child: Text(
                                    "S'inscrire'",
                                    style: TextStyle(
                                        color: Color(0xFF52ccb9),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () {
                                    //widget.changeView();
                                    Navigator.of(context)
                                        .pushNamed("/landingpage");
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

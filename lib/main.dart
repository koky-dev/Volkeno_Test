import 'package:e_learning_volkeno/HomeScreen.dart';
import 'package:e_learning_volkeno/LoginScreen.dart';
import 'package:e_learning_volkeno/RegistrationScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.lightGreen,
      ),
      home: RegistrationScreen(),
      routes: <String, WidgetBuilder> {
        "/landingpage" : (BuildContext context) => new MyApp(),
        "/loginpage" : (BuildContext context) => new LoginScreen(),
        "/homepage" : (BuildContext context) => new HomeScreen(),
      },
    );
  }
}
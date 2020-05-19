import 'package:e_learning_volkeno/LogoImageAsset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 100.0),
        child: Column(
          children: <Widget>[
            LogoImageAsset(),
            SizedBox(height: 50.0),
            SpinKitFadingCube(color: Color(0xFF52ccb9))
          ],
        ),
      ),
    );
  }
}
  
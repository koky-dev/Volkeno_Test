import 'package:e_learning_volkeno/CoursesScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'LogoImageAsset.dart';

class HomeScreen extends StatefulWidget {
  final FirebaseUser user;

  const HomeScreen({Key key, @required this.user}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Color(0xFF52ccb9)),
        backgroundColor: Color(0xFFeff0ed),
        title: Container(
          width: 200,
          child: LogoImageAsset(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Color(0xFF52ccb9)),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0xFF52ccb9),
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                //accountEmail: Text("${widget.user.prenom}"),
                accountName: Text("${widget.user.email}"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://avatars0.githubusercontent.com/u/52114675?s=460&u=c9054d7afacecbc04c9e5222db24e03be52327f4&v=4"),
                ),
                otherAccountsPictures: <Widget>[
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Ajouter un nouveau compte"),
                            );
                          });
                    },
                    child: CircleAvatar(
                      child: Icon(Icons.add),
                    ),
                  )
                ],
              ),
              ListTile(
                leading: Icon(Icons.favorite_border),
                title: Text("Mes Favoris"),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Voir mon Profil"),
              ),
              Divider(),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: ListTile(
                    onTap: () => showDialog(
                        context: context,
                        builder: (context) => _logOutDialog(context)),
                    leading: Icon(Icons.exit_to_app),
                    title: Text("Déconnexion"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          children: <Widget>[
            Text("Unités d'enseignement",
                style: TextStyle(
                  color: Color(0xFF52ccb9),
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 15),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFF4ccbb6),
                      ),
                      width: 50,
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CoursesScreen("Histoire - Géographie")));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Icon(FontAwesomeIcons.globeAfrica,
                                  size: 80, color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 30),
                          Text("Histo-Géo",
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFfa9c56)),
                      width: 50,
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        CoursesScreen("Sciences Physiques")));
                              },
                              child: Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Icon(FontAwesomeIcons.flask,
                                    size: 80, color: Colors.white),
                              )
                            ),
                          SizedBox(height: 30),
                          Text("PC", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFF51d4dc)),
                      width: 50,
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      CoursesScreen("Mathématiques")));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Icon(FontAwesomeIcons.globeAfrica,
                                  size: 80, color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 30),
                          Text("MATHS", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFfcd345)),
                      width: 50,
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CoursesScreen("SVT")));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Icon(FontAwesomeIcons.microscope,
                                  size: 80, color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 30),
                          Text("SVT", style: TextStyle(color: Colors.white, fontSize: 28)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _logOutDialog(context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.all(0),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "Voulez-vous vraiment déconnecter ?",
                style: TextStyle(color: Colors.red),
              ),
              SizedBox(height: 10),
              Wrap(
                children: <Widget>[
                  FlatButton(
                    color: Color(0xFFc4c4c4),
                    child: Text("OUI"),
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        Navigator.of(context)
                            .pushReplacementNamed("/landingpage");
                      }).catchError((e) {
                        print(e);
                      });
                    },
                  ),
                  SizedBox(width: 20),
                  FlatButton(
                    color: Color(0xFFc4c4c4),
                    child: Text("NON"),
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

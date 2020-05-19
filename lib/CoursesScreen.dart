import 'package:e_learning_volkeno/ressources.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'ressources.dart';

class CoursesScreen extends StatefulWidget {
  final String subject;

  const CoursesScreen(this.subject);
  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFFFFFF),
          title: Text(
            widget.subject,
            style: TextStyle(color: Color(0xFF52ccb9)),
          ),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.all(0.0),
                child: FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 26,
                    color: Colors.grey,
                  ),
                  label: Text(''),
                )),
          ],
          bottom: TabBar(
            indicatorColor: Color(0xFF52ccb9),
            tabs: <Widget>[
              Tab(
                  child: Text(
                "Documents",
                style: TextStyle(color: Color(0xFF52ccb9)),
              )),
              Tab(
                  child: Text(
                "Vidéos",
                style: TextStyle(color: Color(0xFF52ccb9)),
              )),
              Tab(
                  child: Text("Téléchargements",
                      style: TextStyle(
                        color: Color(0xFF52ccb9),
                        fontSize: 11,
                      ))),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  //Document document = widget.documents[index];
                  return Column(
                    children: <Widget>[
                      Container(
                        height: 50,
                        child: ListTile(
                            leading: IconButton(
                                icon: FaIcon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                onPressed: () {
                                }),
                            trailing: FaIcon(FontAwesomeIcons.download),
                          title: Text(widget.subject == "Mathématiques"
                                  ? "Géométrie dans l'espace"
                                  : widget.subject == "Histoire - Géographie"
                                      ? "Histoire du Sénégal"
                                      : widget.subject == "SVT"
                                          ? "La reproduction humaine"
                                          : "Les types de forces"),
                        ),
                      ),
                      Container(
                        height: 50,
                        child: Center(
                            child: Text(widget.subject == "Mathématiques"
                                ? "Les nombres premiers"
                                : widget.subject == "Histoire - Géographie"
                                    ? "Les Sites Touristiques au Sénégal"
                                    : widget.subject == "SVT"
                                        ? "Le Système immunitaire"
                                        : "L'électrolyse de l'eau")),
                      ),
                    ],
                  );
                },
                itemCount: 2),
            //Text("Documents"),
            Text("Vidéos"),
            Text("Téléchargements"),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color(0xFF52ccb9),
          elevation: 10,
          items: [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.chalkboardTeacher),
              title: Text('Semestre'),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.heart),
              title: Text('Favoris'),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.folder),
              title: Text('Support'),
            ),
          ],
          currentIndex: 2,
        ),
      ),
      length: 3,
    );
  }
}

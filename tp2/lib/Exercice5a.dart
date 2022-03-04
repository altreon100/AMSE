import 'package:flutter/material.dart';

class Exercice5a extends StatefulWidget {
  const Exercice5a({
    Key? key,
  }) : super(key: key);
  @override
  State<Exercice5a> createState() => Exercice5aState();
}

class Exercice5aState extends State<Exercice5a> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Grid of Colored Boxes"),
          centerTitle: true,
        ),
        body: Center(
            child: GridView.count(
          //Creation de la grille
          primary: false,
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          children: <Widget>[
            //Creation de la liste de container avec l'apparition du texte "title $index"
            Container(
              child: Center(
                child: const Text(
                  "Tile 1",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
              color: Colors.teal[100],
            ),
            Container(
              child: Center(
                child: const Text(
                  'Tile 2',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
              color: Colors.teal[200],
            ),
            Container(
              child: Center(
                child: const Text(
                  'Tile 3',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
              color: Colors.teal[300],
            ),
            Container(
              child: Center(
                child: const Text(
                  'Tile 4',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
              color: Colors.teal[400],
            ),
            Container(
              child: Center(
                child: const Text(
                  'Tile 5',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
              color: Colors.teal[500],
            ),
            Container(
              child: Center(
                child: const Text(
                  'Tile 6',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
              color: Colors.teal[600],
            ),
            Container(
              child: Center(
                child: const Text(
                  'Tile 7',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
              color: Colors.teal[600],
            ),
            Container(
              child: Center(
                child: const Text(
                  'Tile 8',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
              color: Colors.teal[600],
            ),
            Container(
              child: Center(
                child: const Text(
                  'Tile 9',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
              color: Colors.teal[600],
            ),
          ],
        )));
  }
}

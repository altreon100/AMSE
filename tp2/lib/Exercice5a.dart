import 'package:flutter/material.dart';

class Exercise5a extends StatefulWidget {
  const Exercise5a({
    Key? key,
  }) : super(key: key);
  @override
  State<Exercise5a> createState() => Exercise5aState();
}

class Exercise5aState extends State<Exercise5a> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          children: <Widget>[
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
        ));
  }
}

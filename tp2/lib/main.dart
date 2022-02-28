import 'package:flutter/material.dart';
import './Exercice4.dart';
import './Exercice5a.dart';
import './Exercice5b.dart';
import './Exercice5c.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyStatelessWidget(),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          child: ListTile(
            title: Text('Exercice 2'),
            subtitle: Text('Rotate&Scale Image'),
            trailing: Icon(Icons.play_arrow),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Exercice 2b'),
            subtitle: Text('Animated Rotate&Scale Image'),
            trailing: Icon(Icons.play_arrow),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Exercice 4'),
            subtitle: Text('Display a tile'),
            trailing: Icon(Icons.play_arrow),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Exercise4(),
                ),
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Exercice 5a'),
            subtitle: Text('Grid of Colored Boxes'),
            trailing: Icon(Icons.play_arrow),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Exercise5a(),
                ),
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Exercice 5b'),
            subtitle: Text('Fixed Grid of CroppedImage'),
            trailing: Icon(Icons.play_arrow),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Exercise5b(),
                ),
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Exercice 5c'),
            subtitle: Text('Configurable Taquin Board'),
            trailing: Icon(Icons.play_arrow),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Exercise5c(),
                ),
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Exercice 6a'),
            subtitle: Text('Moving Tiles'),
            trailing: Icon(Icons.play_arrow),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Exercice 6b'),
            subtitle: Text('Moving Tiles in Grid'),
            trailing: Icon(Icons.play_arrow),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Exercice 7'),
            subtitle: Text('Taquin Game'),
            trailing: Icon(Icons.play_arrow),
          ),
        ),
      ],
    );
  }
}

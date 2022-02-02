import 'package:flutter/material.dart';


class Favoris extends StatelessWidget{
  const Favoris({Key? key}) : super(key: key);
  @override
    Widget build(BuildContext context){
      return Container(
      margin: const EdgeInsets.all(10.0),
      color: Colors.amber[600],
      width: 48.0,
      height: 48.0,
    );
    }
}

class ButtonFav extends StatefulWidget {
  const ButtonFav({Key? key}) : super(key: key);
  @override
  _ButtonFavState createState() => _ButtonFavState();
}

class _ButtonFavState extends State<ButtonFav> {
  var couleur=Colors.grey;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.favorite,
        size: 20,
      color: couleur,
      ),
      tooltip: "Favoris",
      onPressed: () {
        setState(() {
          if (couleur == Colors.grey) {
            couleur = Colors.red;
          } 
        });
      },
    );
  }
}
import 'package:flutter/material.dart';

var etat_Fav = List.filled(20,false);

class Favoris extends StatefulWidget
{
  const Favoris(this.media, {Key? key}) : super(key: key);
  final int media;
  @override
  Fav_Button createState() => Fav_Button(media);
}


class Fav_Button extends State<Favoris> 
{
  Fav_Button(this.media);
  var couleur;
  final media;
  @override
  void initState() 
  {
    super.initState();
    if (etat_Fav[media] == true) 
    {
      couleur = Colors.red;
    } 
    else 
    {
      couleur = Colors.grey;
    }
  }
 
  @override
  Widget build(BuildContext context) 
  {
    return IconButton
    (
      icon: Icon
      (
        Icons.favorite,
        size: 20,
      color: couleur,
      ),
      onPressed: () 
      {
        setState(() 
        {
          if (couleur == Colors.grey) 
          {
            couleur = Colors.red;
            etat_Fav[media]=true;
          } 
          else 
          {
            couleur = Colors.grey;
            etat_Fav[media] = false;
          }
        });
      },
    );
  }
}
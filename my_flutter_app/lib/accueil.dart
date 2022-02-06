import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Accueil extends StatelessWidget
{
  @override
    Widget build(BuildContext context) 
    {
    return Container
    (
      decoration: BoxDecoration
      (
        gradient: LinearGradient
        ( 
          colors: 
          [
            Colors.blue.shade200,
            Colors.red.shade300,
          ]
        )
      ),
      padding: EdgeInsets.all(14.0),
      child: Column
      (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: 
        [
          const Text
          (
            "Bienvenue sur la page d'accueil de l'application", style: TextStyle(fontSize: 20.0),textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
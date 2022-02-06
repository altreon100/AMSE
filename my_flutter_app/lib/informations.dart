import 'package:flutter/material.dart';

class Informations extends StatelessWidget 
{
  const Informations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    return Container
    (
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration
      (
        gradient: LinearGradient(begin: Alignment.topCenter, colors: 
        [
          Colors.red.shade200,
          Colors.green.shade100,
        ])
      ),
      padding: EdgeInsets.all(16.0),
      child: Column
      (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: 
        [
          const Text
          (
            'Informations',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 150),
          const Text
          (
            'Application de gestion de média réalisé par VANDENDORPE Maxence',
            style: TextStyle(
              fontSize: 26,
            ),
          ),
          const Text
          (
            'Ecrit en février 2022',
            style: TextStyle(
              fontSize: 26,
            ),
          ),
          const Text
          (
            'Application testée sur Windows10 Google Chrome',
            style: TextStyle(
              fontSize: 26,
            ),
          ),
          SizedBox(width: 200),
          SizedBox(width: 200),
          SizedBox(width: 200),
        ],
      ),
    );
  }
}
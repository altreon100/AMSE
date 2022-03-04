import 'package:flutter/material.dart';
import 'dart:math' as math;

class Exercice2a extends StatefulWidget {
  const Exercice2a({
    Key? key,
  }) : super(key: key);
  @override
  State<Exercice2a> createState() => Exercice2aState();
}

class Exercice2aState extends State<Exercice2a> {
  double ValeurZ = 0;
  double ValeurX = 0;
  double Scale = 100;
  int pressed = 0;
  bool ispressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Rotate&Scale Image"),
          centerTitle: true,
        ),
        body: Center(
            child: Container(
                child: Column(children: <Widget>[
          Expanded(
            child: Container(
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.skewY(0)..rotateZ(-ValeurZ * math.pi / 24.0),
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.skewY(0)
                    ..rotateX(-ValeurX * math.pi / 24.0),
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.skewX(0)..scale(Scale / 100),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(pressed * math.pi),
                      child: Image.network('https://picsum.photos/512'),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(children: <Widget>[
            const Text(
              '   RotateZ:',
            ),
            Expanded(
                child: Slider(
                    value: ValeurZ,
                    max: 100,
                    divisions: 100,
                    label: ValeurZ.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        ValeurZ = value;
                      });
                    }))
          ]),
          Row(children: <Widget>[
            const Text(
              '   RotateX:',
            ),
            Expanded(
                child: Slider(
                    value: ValeurX,
                    max: 100,
                    divisions: 100,
                    label: ValeurX.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        ValeurX = value;
                      });
                    }))
          ]),
          Row(children: <Widget>[
            const Text(
              '   Scale:',
            ),
            Expanded(
                child: Slider(
                    value: Scale,
                    max: 100,
                    divisions: 100,
                    label: Scale.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        Scale = value;
                      });
                    }))
          ]),
          Row(children: <Widget>[
            const Text(
              '   Mirror:',
            ),
            Expanded(
                child: IconButton(
              onPressed: () {
                if (pressed == 0) {
                  debugPrint(pressed.toString());
                  setState(() {
                    pressed = 1;
                    ispressed = true;
                  });
                } else {
                  setState(() {
                    pressed = 0;
                    ispressed = false;
                  });
                }
              },
              icon: (ispressed)
                  ? Icon(Icons.check_circle)
                  : Icon(Icons.crop_square),
            ))
          ]),
        ]))));
  }
}

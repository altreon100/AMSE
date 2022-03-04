import 'package:flutter/material.dart';
import 'dart:math' as math;

class Exercice2b extends StatefulWidget {
  const Exercice2b({
    Key? key,
  }) : super(key: key);
  @override
  State<Exercice2b> createState() => Exercice2bState();
}

class Exercice2bState extends State<Exercice2b>
    with SingleTickerProviderStateMixin {
  double ValeurZ = 0;
  double ValeurX = 0;
  double Scale = 100;
  int pressed = 0;
  bool ispressed = false;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000), value: 0);
  }

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
          AnimatedBuilder(
              animation: controller,
              child: Image.network('https://picsum.photos/512'),
              builder: (context, child) {
                return Expanded(
                  child: Container(
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.skewY(0)
                        ..rotateZ((controller.value) * math.pi / 24.0),
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.skewY(0)
                          ..rotateX((controller.value) * math.pi / 24.0),
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.skewX(0)
                            ..scale((controller.value) / 100),
                        ),
                      ),
                    ),
                  ),
                );
              }),
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
                onPressed: () async {
                  // Flip the image
                  await controller.forward();
                  setState(() => ispressed = !ispressed);
                  await controller.reverse();
                },
                icon: Icon(Icons.crop_square),
              ),
            ),
          ]),
        ]))));
  }
}

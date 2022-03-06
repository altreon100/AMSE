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
  //initialisation des slider
  double ValeurZ = 0;
  double ValeurX = 0;
  double Scale = 100;
  int pressed = 0;
  bool ispressed = false;
  late AnimationController controller;
  late Animation<double> animator;
  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    animator = Tween<double>(begin: 0.0, end: 10).animate(controller);

    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(Duration(seconds: 1));
        controller.reset();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
          // RotationTransition(
          //   turns: Tween(begin: 0.0, end: 10.0).animate(controller),
          //   child: Image.network('https://picsum.photos/512'),
          // ),

          AnimatedBuilder(
            animation: controller,

            child: Image.network('https://picsum.photos/512'),
            builder: (context, child)
                // => Transform.rotate(
                //   angle: animator.value,
                =>
                Expanded(
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
                        transform: Matrix4.skewY(controller.value * 0.6),
                        child: child,
                      )),
                ),
              ),
            ),

            //     {
            //   return Expanded(
            //       child: Container(
            //     child: Transform(
            //       alignment: Alignment.center,
            //       transform: Matrix4.skewY(0)
            //         ..rotateZ((controller.value) * math.pi / 24.0),
            //       child: Transform(
            //         alignment: Alignment.center,
            //         transform: Matrix4.skewY(0)
            //           ..rotateX((controller.value) * math.pi / 24.0),
            //         child: Transform(
            //           alignment: Alignment.center,
            //           transform: Matrix4.skewX(0)
            //             ..scale((controller.value) / 100),
            //           child: child,
            //         ),
            //       ),
            //     ),
            //   ));
            // }
          ),
          Row(children: <Widget>[
            const Text(
              '   RotateZ:',
            ),
            Expanded(
                child: Slider(
                    value: controller.value,
                    max: 100,
                    divisions: 100,
                    label: controller.value.round().toString(),
                    onChanged: (double value) {
                      setState(() {});
                    }))
          ]),
          Row(children: <Widget>[
            const Text(
              '   RotateX:',
            ),
            Expanded(
                child: Slider(
                    value: controller.value,
                    max: 100,
                    divisions: 100,
                    label: controller.value.round().toString(),
                    onChanged: (double value) {
                      setState(() {});
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
                  // Flip the image
                  controller.forward(from: 0.0);
                },
                icon: Icon(Icons.crop_square),
              ),
            ),
          ]),
        ]))));
  }
}

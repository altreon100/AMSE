import 'package:flutter/material.dart';
List<double> val_slider=[0,0,100];
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const image(),
              Row(children: <Widget>[
                const Text(
                  '   RotateX:',
                ),
                Expanded(
                  child: const MyStatefulWidget(0),
                )
              ]),
              Row(children: <Widget>[
                const Text(
                  '   RotateZ:',
                ),
                Expanded(
                  child: const MyStatefulWidget(1),
                )
              ]),
              Row(children: <Widget>[
                const Text(
                  '  Mirror:',
                ),
                button(),
              ]),
              Row(children: <Widget>[
                const Text(
                  '  Scale:',
                ),
                Expanded(
                  child: const MyStatefulWidget(2),
                )
              ]),
            ]),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget(this.indice,{Key? key}) : super(key: key);
  final int indice;
  @override

  State<MyStatefulWidget> createState() => _MyStatefulWidgetState(indice);
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  _MyStatefulWidgetState(this.indice);
  final indice;
  var valeur;

  @override
  void initState(){
    super.initState();
    valeur=val_slider[indice];
  }


  @override
  Widget build(BuildContext context) {
    return Slider(
      value: valeur,
      max: 100,
      divisions: 5,
      label: valeur.round().toString(),
      onChanged: (double value) {
        setState(() {
          valeur = value;
        });
        val_slider[indice]=valeur;
      },
      
    );
  }
}

class button extends StatefulWidget {
  const button({Key? key}) : super(key: key);

  @override
  _buttonState createState() => _buttonState();
}

class _buttonState extends State<button> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {});
      },
      icon: const Icon(Icons.crop_square),
    );
  }
}

class image extends StatefulWidget {
  const image({Key? key}) : super(key: key);

  @override
  _imageState createState() => _imageState();
}

class _imageState extends State<image> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Transform(
        transform: Matrix4.rotationZ(3.14 / 9),
        child: Transform.rotate(
          angle: val_slider[0]*360/100,
          child: Transform.scale(
            scale: val_slider[2]/100,
            child: Image.network(
              'https://picsum.photos/512/1024',
              width: 300,
              height: 500,
            ),
          ),
        ),
      ),
    );
  }
}
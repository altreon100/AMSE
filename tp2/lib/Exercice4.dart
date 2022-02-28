import 'package:flutter/material.dart';

class Tile {
  String image;
  Alignment alignment;
  Tile({required this.image, required this.alignment});

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: this.alignment,
            widthFactor: 0.3,
            heightFactor: 0.3,
            child: Image.network(this.image),
          ),
        ),
      ),
    );
  }
}

class Exercise4 extends StatefulWidget {
  const Exercise4({
    Key? key,
  }) : super(key: key);
  @override
  State<Exercise4> createState() => DisplayTileWidget();
}

class DisplayTileWidget extends State<Exercise4> {
  Tile tile = new Tile(
    image: 'https://picsum.photos/512',
    alignment: Alignment(0, 0),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display a Tile as a Cropped Image'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(children: [
        SizedBox(
            width: 150.0,
            height: 150.0,
            child: Container(
                margin: EdgeInsets.all(20.0),
                child: this.createTileWidgetFrom(tile))),
        Container(
            height: 200,
            child:
                Image.network('https://picsum.photos/512', fit: BoxFit.cover))
      ])),
    );
  }

  Widget createTileWidgetFrom(Tile tile) {
    return InkWell(
      child: tile.croppedImageTile(),
      onTap: () {},
    );
  }
}

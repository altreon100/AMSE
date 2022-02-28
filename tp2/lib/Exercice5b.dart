import 'package:flutter/material.dart';

class Exercise5b extends StatefulWidget {
  const Exercise5b({
    Key? key,
  }) : super(key: key);
  @override
  State<Exercise5b> createState() => _Exercise5bState();
}

class Tile extends StatelessWidget {
  String image;
  double factor;
  Alignment alignment;
  Function()? onTap;

  Tile(
      {Key? key,
      required this.alignment,
      required this.factor,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Align(
          alignment: alignment,
          widthFactor: factor,
          heightFactor: factor,
          child: Image.asset(image),
        ),
      ),
    );
  }
}

class _Exercise5bState extends State<Exercise5b> {
  List<Tile> tiles = [
    Tile(
      alignment: Alignment.topLeft,
      factor: 1 / 3,
      image: 'https://picsum.photos/512',
    ),
    Tile(
      alignment: Alignment.topCenter,
      factor: 1 / 3,
      image: 'https://picsum.photos/512',
    ),
    Tile(
      alignment: Alignment.topRight,
      factor: 1 / 3,
      image: 'https://picsum.photos/512',
    ),
    Tile(
      alignment: Alignment.centerLeft,
      factor: 1 / 3,
      image: 'https://picsum.photos/512',
    ),
    Tile(
      alignment: Alignment.center,
      factor: 1 / 3,
      image: 'https://picsum.photos/512',
    ),
    Tile(
      alignment: Alignment.centerRight,
      factor: 1 / 3,
      image: 'https://picsum.photos/512',
    ),
    Tile(
      alignment: Alignment.bottomLeft,
      factor: 1 / 3,
      image: 'https://picsum.photos/512',
    ),
    Tile(
      alignment: Alignment.bottomCenter,
      factor: 1 / 3,
      image: 'https://picsum.photos/512',
    ),
    Tile(
      alignment: Alignment.bottomRight,
      factor: 1 / 3,
      image: 'https://picsum.photos/512',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        children: [
          createTileWidgetFrom(tiles[0]),
          createTileWidgetFrom(tiles[1]),
          createTileWidgetFrom(tiles[2]),
          createTileWidgetFrom(tiles[3]),
          createTileWidgetFrom(tiles[4]),
          createTileWidgetFrom(tiles[5]),
          createTileWidgetFrom(tiles[6]),
          createTileWidgetFrom(tiles[7]),
          createTileWidgetFrom(tiles[8]),
        ],
      ),
    );
  }

  Widget createTileWidgetFrom(Tile tile) {
    return InkWell(
      child: tile,
      onTap: () {
        print("tapped on tile");
      },
    );
  }
}

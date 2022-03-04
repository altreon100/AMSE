import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  String image;
  double zoom;
  Alignment alignment;
  Function()? onTap;

  Tile(
      {Key? key,
      required this.alignment,
      required this.zoom,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Align(
          alignment: alignment,
          widthFactor: zoom,
          heightFactor: zoom,
          child: Image.network(this.image),
        ),
      ),
    );
  }
}

class Exercice5b extends StatefulWidget {
  const Exercice5b({
    Key? key,
  }) : super(key: key);
  @override
  State<Exercice5b> createState() => Exercice5bState();
}

class Exercice5bState extends State<Exercice5b> {
  List<Tile> tiles = [];

  @override
  Widget build(BuildContext context) {
    createTiles();
    return Scaffold(
      appBar: AppBar(
        title: Text("Fixed Grid of CroppedImage"),
        centerTitle: true,
      ),
      body: Center(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(5),
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          crossAxisCount: 3,
          children: [
            createTileWidgetFrom(
                tiles[0]), // appel de la fonction afin de créer les tiles
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
      ),
    );
  }

  void createTiles() {
    // fonction qui créer des tiles de manière itératif 9 tiles seront crées avec le bon alignement
    tiles = [];
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        tiles.add(Tile(
          alignment: Alignment(-1.0 + j, -1.0 + i),
          zoom: 1 / 3,
          image: 'https://picsum.photos/512',
        ));
      }
    }
  }

  Widget createTileWidgetFrom(Tile tile) {
    return InkWell(
      child: tile,
      onTap: () {},
    );
  }
}

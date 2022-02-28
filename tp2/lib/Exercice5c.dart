import 'package:flutter/material.dart';
import './Exercice5b.dart';

class Exercise5c extends StatefulWidget {
  const Exercise5c({
    Key? key,
  }) : super(key: key);
  @override
  State<Exercise5c> createState() => Exercise5cState();
}

class Exercise5cState extends State<Exercise5c> {
  double tilesDivisions = 3.0;
  List<Tile> tiles = [];

  @override
  Widget build(BuildContext context) {
    final double cWidth = MediaQuery.of(context).size.width;
    createTiles2();
    return Scaffold(
        appBar: AppBar(
          title: Text("Configurable Taquin Board"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: cWidth,
                height: cWidth,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: tilesDivisions.toInt()),
                    itemCount: tiles.length,
                    itemBuilder: (context, index) {
                      return createTileWidgetFrom(tiles[index]);
                    }),
              ),
              Row(
                children: [
                  const Text("Divisions : "),
                  Expanded(
                    child: Slider(
                      value: tilesDivisions,
                      min: 2,
                      max: 10,
                      divisions: 8,
                      onChanged: (double value) {
                        setState(() {
                          tilesDivisions = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  void createTiles2() {
    tiles = [];
    for (int i = 0; i < tilesDivisions; i++) {
      for (int j = 0; j < tilesDivisions; j++) {
        tiles.add(Tile(
          alignment: Alignment(-1 + 2 * j / (tilesDivisions - 1),
              -1 + 2 * i / (tilesDivisions - 1)),
          zoom: 1 / tilesDivisions,
          image: 'https://picsum.photos/512',
        ));
      }
    }
  }

  Widget createTileWidgetFrom(Tile tile) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(2),
        child: tile,
      ),
      onTap: () {},
    );
  }
}

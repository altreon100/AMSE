import 'package:flutter/material.dart';
import 'dart:math' as math;

math.Random random = new math.Random();

class Tile {
  String text;
  String typeTile;
  Tile(this.text, this.typeTile);
}

class TileWidget extends StatelessWidget {
  final Tile tile;
  TileWidget(this.tile);

  @override
  Widget build(BuildContext context) {
    if (tile.typeTile == "Empty") {
      // Si la tuile est de type Empty alors on crée une tuile blanche avec écrit "Empty"
      return TileEmpty(tile);
    } else {
      // Si la tuile est de type Normal ou SwapTiles alors on crée une tuile de couleur aléatoire avec écrit "Tile" et son numéro
      return Tile_Normal(tile);
    }
  }

  Widget TileEmpty(Tile tile) {
    // création d'une tuile de type Empty
    return Container(
        child: Center(
            child: Text(
      "Empty",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20.0),
    )));
  }

  Widget Tile_Normal(Tile tile) {
    // création d'un tuile de type Normal ou SwapTiles
    return Container(
      child: Center(
        child: Text(
          tile.text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      color: Color.fromARGB(
          255, random.nextInt(255), random.nextInt(255), random.nextInt(255)),
    );
  }
}

class Exercice6b extends StatefulWidget {
  const Exercice6b({
    Key? key,
  }) : super(key: key);
  @override
  State<Exercice6b> createState() => Exercice6bState();
}

class Exercice6bState extends State<Exercice6b> {
  int nbDecoupage = 3; // Correspond aux nombres de tuiles souhaité ici  3²=9
  int indexTileEmpty =
      4; // Correspond à l'indice de la tuile Empty ici 4 (au centre)
  List<Tile> tiles = [];
  @override
  Widget build(BuildContext context) {
    createTiles();
    return Scaffold(
        appBar: AppBar(
          title: Text("Moving Tiles in Grid"),
          centerTitle: true,
        ),
        body: Center(
            child: Container(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: nbDecoupage),
                    itemCount: tiles.length,
                    itemBuilder: (context, index) {
                      return createTileWidgetFrom(tiles[index], index);
                    }))));
  }

  Widget createTileWidgetFrom(Tile tile, int index) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(2),
        child: TileWidget(tile),
      ),
      onTap: () {
        setState(() {
          swapTiles(index);
        });
      },
    );
  }

  void createTiles() {
    if (tiles.isEmpty) {
      // Pour le premier chargement du jeu on créé des tuiles de nbDecoupage² de type Normal
      for (int i = 0; i < nbDecoupage * nbDecoupage; i++) {
        tiles.add(Tile("Tile $i", "Normal"));
      }
    }
    for (int j = 0; j < nbDecoupage * nbDecoupage; j++) {
      // dans tous les autres cas on regarde si l'indice de la tuile est celui de la tuile vide auquel cas on met son type a Empty
      //Si elle peut être échanger avec la tuile Empty on met son type a SwapTiles et sinon son type est Normal
      if (j == indexTileEmpty) {
        tiles[j].typeTile = "Empty";
      } else if (canSwitch(j)) {
        tiles[j].typeTile = "SwapTiles";
      } else {
        tiles[j].typeTile = "Normal";
      }
    }
  }

  void swapTiles(int i) {
    //fonction qui permet d'échanger 2 tuiles
    if (tiles[i].typeTile == "SwapTiles") {
      Tile swapTiles = tiles[indexTileEmpty];
      tiles[indexTileEmpty] = tiles[i];
      tiles[i] = swapTiles;
      indexTileEmpty = i;
    }
  }

  bool canSwitch(int i) {
    // Si la tuile est à droite/gauche de la tuile Empty et que l'indice i n'est pas un indice des tuiles des extrêmes gauche/droite alors la tuile est considéré comme "SwapTiles"
    if ((i == indexTileEmpty + 1 && indexTileEmpty % nbDecoupage != 2) ||
        (i == indexTileEmpty - 1 && indexTileEmpty % nbDecoupage != 0)) {
      return true;
    }
    // Si la tuile est en bas/en haut de la tuile Empty et que l'indice de la tuile Empty n'est pas sur la première ou dernière ligne alors la tuile est considéré "Swap tiles"
    else if ((i == indexTileEmpty + nbDecoupage && indexTileEmpty <= 5) ||
        (i == indexTileEmpty - nbDecoupage && indexTileEmpty >= nbDecoupage)) {
      return true;
    }
    return false;
  }
}

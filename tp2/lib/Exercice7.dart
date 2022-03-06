import 'package:flutter/material.dart';
import 'dart:math' as math;

math.Random random = new math.Random();

class Tile {
  String image;
  Alignment alignment;
  double zoom;
  String typeTile;
  Tile(this.image, this.alignment, this.zoom, this.typeTile);
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
    return Container();
  }

  Widget Tile_Normal(Tile tile) {
    // création d'un tuile de type Normal ou SwapTiles
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Align(
          alignment: tile.alignment,
          widthFactor: tile.zoom,
          heightFactor: tile.zoom,
          child: Image.network(tile.image),
        ),
      ),
    );
  }
}

class Exercice7 extends StatefulWidget {
  const Exercice7({
    Key? key,
  }) : super(key: key);
  @override
  State<Exercice7> createState() => Exercice7State();
}

class Exercice7State extends State<Exercice7> {
  int nbDecoupage = 3; // Correspond aux nombres de tuiles souhaité ici  3²=9
  int indexTileEmpty =
      4; // Correspond à l'indice de la tuile Empty ici 4 (au centre)
  List<Tile> tiles = [];
  int indexPrev = 0; // utilisé lors du retour en arrière
  int CompteurCoup = 0; // compteur de coup
  bool isLaunch = false;
  @override
  Widget build(BuildContext context) {
    tiles.clear;
    createTiles();
    return Scaffold(
        appBar: AppBar(
          title: Text("Taquin Game"),
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
                    }))),
        bottomNavigationBar: bottomBar());
  }

  Widget createTileWidgetFrom(Tile tile, int index) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(1),
        child: TileWidget(tile),
      ),
      onTap: () {
        setState(() {
          if (isLaunch) {
            indexPrev = indexTileEmpty;
            // Si la partie est en cours on échange
            swapTiles(index);
          }
          if (isEnd() && isLaunch) {
            // Si la partie est en cours et que le jeu est gagné on arrête et affiche le message
            isLaunch = false;
            showDialog(
              context: context,
              builder: (BuildContext context) => AfficheVictoire(context),
            );
          }
        });
      },
    );
  }

  Widget AfficheVictoire(BuildContext context) {
    // Permet l'affichage de la boîte de dialogue pour la victoire
    return new AlertDialog(
      title: const Text('Partie Gagnée'),
      content: new Column(
        children: <Widget>[
          Text("Bravo, vous avez gagné la partie "),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Retour au menu'),
        ),
      ],
    );
  }

  void createTiles() {
    if (tiles.isEmpty) {
      // Pour le premier chargement du jeu on créé des tuiles de nbDecoupage² de type Normal
      for (int i = 0; i < nbDecoupage; i++) {
        for (int j = 0; j < nbDecoupage; j++) {
          tiles.add(Tile(
              'https://picsum.photos/512',
              Alignment(-1 + 2 * j / (nbDecoupage - 1),
                  -1 + 2 * i / (nbDecoupage - 1)),
              1 / nbDecoupage,
              "Normal"));
        }
      }
    }
    for (int k = 0; k < nbDecoupage * nbDecoupage; k++) {
      // dans tous les autres cas on regarde si l'indice de la tuile est celui de la tuile vide auquel cas on met son type a Empty
      //Si elle peut être échanger avec la tuile Empty on met son type a SwapTiles et sinon son type est Normal
      if (k == indexTileEmpty) {
        if (!isLaunch) {
          // Si la partie n'est pas lancé on n'affiche pas la case empty afin de voir l'image entièrement
          tiles[k].typeTile = "Normal";
        } else {
          tiles[k].typeTile = "Empty";
        }
      } else if (canSwitch(k)) {
        tiles[k].typeTile = "SwapTiles";
      } else {
        tiles[k].typeTile = "Normal";
      }
    }
  }

  void swapTiles(int i) {
    //fonction qui permet d'échanger la tuile Empty avec une tuile proche d'elle
    if (tiles[i].typeTile == "SwapTiles") {
      Tile swapTiles = tiles[indexTileEmpty];
      tiles[indexTileEmpty] = tiles[i];
      tiles[i] = swapTiles;
      indexTileEmpty = i;
      CompteurCoup++;
    }
  }

  void swapTiles2(int i, int j) {
    //fonction qui permet d'échanger 2 tuiles
    Tile swapTiles = tiles[j];
    tiles[j] = tiles[i];
    tiles[i] = swapTiles;
  }

  bool canSwitch(int i) {
    // Si la tuile est à droite/gauche de la tuile Empty et que l'indice i n'est pas un indice des tuiles des extrêmes gauche/droite alors la tuile est considéré comme "SwapTiles"
    if ((i == indexTileEmpty + 1 &&
            indexTileEmpty % nbDecoupage != nbDecoupage - 1) ||
        (i == indexTileEmpty - 1 && indexTileEmpty % nbDecoupage != 0)) {
      return true;
    }
    // Si la tuile est en bas/en haut de la tuile Empty et que l'indice de la tuile Empty n'est pas sur la première ou dernière ligne alors la tuile est considéré "Swap tiles"
    else if ((i == indexTileEmpty + nbDecoupage &&
            indexTileEmpty <= (nbDecoupage - 1) * nbDecoupage - 1) ||
        (i == indexTileEmpty - nbDecoupage && indexTileEmpty >= nbDecoupage)) {
      return true;
    }
    return false;
  }

  bool isEnd() {
    int indexTile = 0;
    // il faut vérifier que chaque tuile correspondent bien à l'alignement de début
    for (int i = 0; i < nbDecoupage; i++) {
      for (int j = 0; j < nbDecoupage; j++) {
        if (tiles[indexTile].alignment !=
            Alignment(-1 + 2 * j / (nbDecoupage - 1),
                -1 + 2 * i / (nbDecoupage - 1))) {
          return false;
        }
        indexTile++;
      }
    }
    return true;
  }

  void Melange() {
    // fonction qui permet de mélanger aléatoirement des tuiles du jeu
    createTiles();
    int nbRand1 = 0;
    int nbRand2 = 0;
    for (int i = 0; i < nbDecoupage; i++) {
      // on prend 2 nombres aléatoires qui correspondent aux indices de tuiles et on les échanges
      nbRand1 = random.nextInt(nbDecoupage * nbDecoupage);
      nbRand2 = random.nextInt(nbDecoupage * nbDecoupage);

      swapTiles2(nbRand1, nbRand2);
    }
    indexTileEmpty = nbRand1;
  }

  void Back() {
    Tile echange = tiles[indexTileEmpty];
    tiles[indexTileEmpty] = tiles[indexPrev];
    tiles[indexPrev] = echange;
    indexTileEmpty = indexPrev;
  }

  Widget bottomBar() {
    return BottomAppBar(
        child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (!isLaunch)
                    Expanded(
                        child: Container(
                            child: FloatingActionButton.extended(
                      // Si on appuie sur le bouton - on diminue le nombre de case
                      onPressed: () {
                        setState(() {
                          if (nbDecoupage > 3) {
                            tiles.clear();
                            nbDecoupage--;
                          }
                        });
                      },
                      label: const Text(''),
                      icon: Icon(Icons.remove),
                      backgroundColor: Colors.red,
                    ))),
                  if (!isLaunch)
                    Expanded(
                        child: Container(
                            child: FloatingActionButton.extended(
                      onPressed: () {
                        setState(() {
                          isLaunch = true;
                          while (isEnd()) {
                            // Tant que le jeu n'est pas mélanger (évite les faux mélanges)
                            Melange();
                          }
                          CompteurCoup = 0;
                          createTiles();
                        });
                      },
                      label: const Text(''),
                      icon: Icon(Icons.play_arrow),
                      backgroundColor: Colors.green,
                    ))),
                  if (!isLaunch)
                    Expanded(
                        child: Container(
                            // Si on appuie sur le bouton + on augmente le nombre de case
                            child: FloatingActionButton.extended(
                      onPressed: () {
                        setState(() {
                          if (nbDecoupage < 10) {
                            tiles.clear();
                            nbDecoupage++;
                          }
                        });
                      },
                      label: const Text(''),
                      icon: Icon(Icons.add),
                      backgroundColor: Colors.red,
                    ))),
                  if (isLaunch)
                    Container(
                        child: FloatingActionButton.extended(
                      onPressed: () {
                        setState(() {
                          if (CompteurCoup != 0) {
                            Back();
                          }
                          createTiles();
                        });
                      },
                      label: const Text(''),
                      icon: Icon(Icons.undo),
                      backgroundColor: Colors.blue,
                    )),
                  if (isLaunch)
                    Container(
                        child: FloatingActionButton.extended(
                      onPressed: () {
                        setState(() {
                          tiles.clear();
                          indexTileEmpty = nbDecoupage;
                          CompteurCoup = 0;
                          isLaunch = false;
                        });
                      },
                      label: const Text('Menu'),
                      icon: Icon(Icons.menu),
                      backgroundColor: Colors.blue,
                    )),
                  if (isLaunch)
                    Container(child: Text("    Nombre de coup: $CompteurCoup"))
                ])));
  }
}

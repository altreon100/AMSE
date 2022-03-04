import 'package:flutter/material.dart';
import './Exercice5b.dart';

class Exercice5c extends StatefulWidget {
  const Exercice5c({
    Key? key,
  }) : super(key: key);
  @override
  State<Exercice5c> createState() => Exercice5cState();
}

class Exercice5cState extends State<Exercice5c> {
  double nbDecoupage =
      3.0; // Correspond aux nombres de tuiles souhaité (ici par défault 3²=9)
  List<Tile> tiles = [];

  @override
  Widget build(BuildContext context) {
    double Width =
        MediaQuery.of(context).size.width; //on récupère la largeur de l'écran
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
                width: Width,
                height: Width,
                child: GridView.builder(
                    // on utilise la fonction builder afin de créer une grille spécifique qui a une taille qui dépend d'une variable
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: nbDecoupage.toInt()),
                    itemCount: tiles.length,
                    itemBuilder: (context, index) {
                      return createTileWidgetFrom(tiles[index]);
                    }),
              ),
              Row(
                children: [
                  // création du slider
                  const Text("NombreDivisions : "),
                  Expanded(
                    child: Slider(
                      value: nbDecoupage,
                      min: 3,
                      max: 10,
                      divisions: 7,
                      onChanged: (double value) {
                        setState(() {
                          nbDecoupage =
                              value; // nbDecoupage sera modifié en fonction de la valeur du slider
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
    // fonction reprise de l'exercice 5b avec cette fois-ci la possibilité de créer nbDecoupage² tuiles avec un alignement qui reste dans l'intervale -1;1
    tiles = [];
    for (int i = 0; i < nbDecoupage; i++) {
      for (int j = 0; j < nbDecoupage; j++) {
        tiles.add(Tile(
          alignment: Alignment(
              -1 + 2 * j / (nbDecoupage - 1), -1 + 2 * i / (nbDecoupage - 1)),
          zoom: 1 / nbDecoupage,
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

import 'package:flutter/material.dart';
import './favoris.dart';

class Film extends StatelessWidget
{
  List<String> items= 
  [
     'Seigneur des anneaux',
     'Le Labyrinthe',
     'Titanic',
     'Avatar',
     'Le père Noël est une ordure',
     'Le dîner de cons',
     'Jurassic Park',
  ];

  List<String> descriptions= 
  [
     "Le jeune et timide Hobbit, Frodon Sacquet, hérite d'un anneau. Bien loin d'être une simple babiole, il s'agit de l'Anneau Unique, un instrument de pouvoir absolu qui permettrait à Sauron, le Seigneur des ténèbres, de régner sur la Terre du Milieu et de réduire en esclavage ses peuples. À moins que Frodon, aidé d'une Compagnie constituée de Hobbits, d'Hommes, d'un Magicien, d'un Nain, et d'un Elfe, ne parvienne à emporter l'Anneau à travers la Terre du Milieu jusqu'à la Crevasse du Destin, lieu où il a été forgé.",
     "Quand Thomas reprend connaissance, il est pris au piège avec un groupe d’autres garçons dans un labyrinthe géant dont le plan est modifié chaque nuit. Il n’a plus aucun souvenir du monde extérieur, à part d’étranges rêves à propos d’une mystérieuse organisation appelée W.C.K.D. En reliant certains fragments de son passé, avec des indices qu’il découvre au sein du labyrinthe, Thomas espère trouver un moyen de s’en échapper.",
     "Southampton, 10 avril 1912. Le paquebot le plus grand et le plus moderne du monde, réputé pour son insubmersibilité, le 'Titanic', appareille pour son premier voyage. Quatre jours plus tard, il heurte un iceberg. A son bord, un artiste pauvre et une grande bourgeoise tombent amoureux.",
     "Malgré sa paralysie, Jake Sully, un ancien marine immobilisé dans un fauteuil roulant, est resté un combattant au plus profond de son être. Il est recruté pour se rendre à des années-lumière de la Terre, sur Pandora, où de puissants groupes industriels exploitent un minerai rarissime destiné à résoudre la crise énergétique sur Terre.",
     "La permanence téléphonique parisienne SOS détresse-amitié est perturbée le soir de Noël par l'arrivée de personnages marginaux farfelus qui provoquent des catastrophes en chaîne.",
     "Tous les mercredis, Pierre Brochant et ses amis organisent un dîner où chacun doit amener un con. Celui qui a trouvé le plus spectaculaire est declaré vainqueur. Ce soir, Brochant exulte, il est sur d'avoir trouvé la perle rare, un con de classe mondiale: Francois Pignon, comptable au ministère des Finances et passionné de modèles réduits en allumettes. Ce qu'il ignore c'est que Pignon est passe maître dans l'art de déclencher des catastrophes.",
     "C'est à partir d'une goutte de sang absorbée par un moustique fossilisé que John Hammond et son équipe ont réussi à faire renaître une dizaine d'espèces de dinosaures. Il s'apprête maintenant avec la complicité du docteur Alan Grant, paléontologue de renom, et de son amie Ellie, à ouvrir le plus grand parc à thème du monde. Mais c'était sans compter la cupidité et la malveillance de l'informaticien Dennis Nedry, et éventuellement des dinosaures, seuls maîtres sur l'île...",

  ];
  @override
    Widget build(BuildContext context)=>Scaffold
    (
      body:buildList(),
    );

    Widget buildList()=>ListView.builder
    (
      itemCount: items.length,
      itemExtent:250,
      itemBuilder:(context,index)
      {
        final item=items[index];
        final description=descriptions[index];
        return Container(height: 200, child:ListTile
        (
          leading: ConstrainedBox
          (
            constraints: BoxConstraints
            (
              minWidth: 60,
              minHeight: 60,
              maxWidth: 250,
              maxHeight: 250,
            ),
          child: Image.asset('images2/$index.jpg', fit: BoxFit.cover),
          ),
          trailing:Favoris((index+7)),
          title:Text(item,style: TextStyle(fontSize: 40.0),),
          subtitle:Text(description,style: TextStyle(fontSize: 24.0),),
          dense:true,
        ));
      },
    );
}

import 'package:flutter/material.dart';
import './favoris.dart';

class Manga extends StatelessWidget
{
  List<String> items= 
  [
     'Code Geass',
     'One Piece',
     'Fairy Tail',
     'Naruto',
     'Seven Deadly Sins',
     'Attack On Titans',
     'Tokyo Ghoul',
  ];

  List<String> descriptions= 
  [
     "En 2017, le Japon vit sous le joug de l'empire de Britannia. Rebaptisé 'Zone Eleven', le pays subit quotidiennement la terreur de l'occupant qui réprime toute sédition grâce à ses armées de Mécas, les 'Nightmare Frames'. Mais le jour de la révolte a peut-être sonné lorsqu'un jeune étudiant du nom de Lelouch Lamperouge va se retrouver accidentellement impliqué dans un attentat terroriste. Alors qu'il aurait dû mourir, Lelouch va au contraire survivre, et même hériter d'un mystérieux pouvoir, le 'Geass', qui donne à celui qui le détient la possibilité de contrôler la volonté d'autrui. Ce pouvoir permettra-t-il à Lelouch de faire vaciller l'empire de Britannia ?",
     "Il fut un temps où Gold Roger était le plus grand de tous les pirates, le 'Roi des Pirates' était son surnom. A sa mort, son trésor d'une valeur inestimable connu sous le nom de 'One Piece' fut caché quelque part sur Grand Line. De nombreux pirates sont partis à la recherche de ce trésor mais tous sont morts avant même de l'atteindre. Monkey D. Luffy rêve de retrouver ce trésor légendaire et de devenir le nouveau 'Roi des Pirates'. Après avoir mangé un fruit du démon, il possède un pouvoir lui permettant de réaliser son rêve. Il lui faut maintenant trouver un équipage pour partir à l'aventure !",
     "Lucy est une jeune magicienne de 16 ans à la recherche d'une guilde. Fan de magie depuis sa plus tendre enfance, elle lisait régulièrement des magazines sur les guildes, et a finalement voulu en intégrer une. Dans ce but, elle est devenue magicienne des clés stellaires, un mage capable d'appeler des esprits avec qui il a conclu un pacte au moyen de clés.Lucy rêverait d'intégrer la glorieuse guilde de Fairy Tail, mais elle n'a aucune idée de leurs méthodes de recrutement, et a un peu peur face à la réputation de 'guilde à problème' qu'elle traîne. Mais bien vite, elle laisse ses remords de côté lorsqu'un mage du feu prétend être de la guilde et l'invite à bord de son bateau. Ce n'est qu'un imposteur, mais elle est sauvée par Natsu, un jeune homme qu'elle avait rencontré peu avant et qui, lui, est un véritable membre de la guilde.",
     "Lucy rêverait d'intégrer la glorieuse guilde de Fairy Tail, mais elle n'a aucune idée de leurs méthodes de recrutement, et a un peu peur face à la réputation de 'guilde à problème' qu'elle traîne. Mais bien vite, elle laisse ses remords de côté lorsqu'un mage du feu prétend être de la guilde et l'invite à bord de son bateau. Ce n'est qu'un imposteur, mais elle est sauvée par Natsu, un jeune homme qu'elle avait rencontré peu avant et qui, lui, est un véritable membre de la guilde.",
     "Il y a dix ans, un groupe de Chevaliers Sacrés renégats appelé les Seven Deadly Sins s'est rebellé contre les Chevaliers Sacrés, la garde du royaume. Depuis, ils ont disparu et personne ne sait ce qu'ils sont devenus. Un beau jour, une mystérieuse jeune fille s'écroule dans la taverne de Meliodas, un garçon enjoué qui parcourt le monde en compagnie de son cochon loquace. Cette jeune fille n'est autre que la princesse Elizabeth qui désire ardemment retrouver les Seven Deadly Sins. En effet, ce sont les seuls à même de lutter contre les Chevaliers Sacrés, qui ont fait prisonnier le roi et qui asservissent toute la population du royaume. Très vite, elle va découvrir que Meliodas n'est pas un simple patron de taverne mais un guerrier à la puissance exceptionnelle…",
     "Dans un monde ravagé par des titans mangeurs d’homme depuis plus d’un siècle, les rares survivants de l’Humanité n’ont d’autre choix pour survivre que de se barricader dans une cité-forteresse. Le jeune Eren, témoin de la mort de sa mère dévorée par un titan, n’a qu’un rêve : entrer dans le corps d’élite chargé de découvrir l’origine des Titans et les annihiler jusqu’au dernier…",
     "Elles se fondent dans la foule pour mieux se nourrir de chair humaine. Elles ressemblent aux hommes, mais leur existence est bien différente... Elles sont appelées 'goules'. Le CCG, une organisation gouvernementale chargée d'étudier et d'éradiquer les goules, met sur pied un nouveau groupe composé de sujets expérimentaux. Leur nom : les 'Quinx'. Dirigé par l'inspecteur Haise Sasaki, ce groupe atypique se voit confier une mission tout aussi singulière. Quel destin les attend dans les tréfonds de la capitale japonaise ?",
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
          child: Image.asset('images/$index.jpg', fit: BoxFit.cover),
          ),
          trailing:Favoris(index),
          title:Text(item,style: TextStyle(fontSize: 40.0),),
          subtitle:Text(description,style: TextStyle(fontSize: 24.0),),
          dense:true,
        ));
      },
    );     
}


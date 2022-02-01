import 'package:flutter/material.dart';


class j_v extends StatelessWidget{

  List<String> items= [
     'Final Fantasy XIV',
     'Total War: Three Kingdoms',
     'The Witcher',
     'Overlord II',
     'Aura Kingdom',
     'Mount & Blade',
  ];

  List<String> descriptions= [
     "Final Fantasy XIV met en scène le monde d'Hydaelyn, et plus précisément la région d'Éorzéa. Cette dernière abrite plusieurs cités-États qui maintiennent des relations plus ou moins ambigües : unies dans une même croyance religieuse, certaines sont parfois en conflit. Le jeu prend place alors qu'un empire conquérant menace Éorzéa et compte bien profiter des dissensions entre les cités.",
     "Le jeu commence en 190 après JC au cours duquel la dynastie des Han, autrefois glorieuse, est sur le point de s'effondrer. Le nouvel empereur Han Xiandi, intronisé à l'âge de huit ans, a été manipulé par le premier ministre et seigneur de guerre Dong Zhuo, dont le règne oppressif mène au chaos. De nouveaux chefs de guerre se lèvent et forment des alliances pour lancer une campagne à son égard. Chaque chef de guerre ayant des ambitions personnelles et des allégeances en constante évolution, les champions issus des guerres qui se prolongent façonneront l’avenir de la Chine.",
     "Geralt, devenu amnésique, est ramené à Kaer Morhen, la forteresse ancestrale des Sorceleurs, maintenant en ruine et presque vide, car les Sorceleurs ont été presque tous tués lors d'un pogrom ayant eu lieu des années auparavant. Bientôt, ceux-ci sont attaqués par un groupe inconnu mais important. Ses membres présentent deux particularités : d'abord, ils portent des broches sur lesquelles figurent une salamandre. Ensuite, ils semblent beaucoup s'intéresser au laboratoire de la forteresse, lieu où sont entreposés et fabriqués les précieux mutagènes qui confèrent aux Sorceleurs leurs incroyables capacités.Qui étaient ces assaillants ? D'où venaient-ils ? Qui les a envoyés ? Autant de questions auxquelles Geralt devra tenter de répondre.",
     "Il y a plusieurs années, l'Overlord, seigneur suprême de la Tour Noire, a disparu avec la fermeture de la dernière Porte des Abysses... Il est ainsi enfermé en enfer...Cependant, sa Maîtresse était enceinte, et les Larbins ont donc décidé d'attendre la naissance de leur futur nouveau maître...Mais un événement imprévu, le Grand Cataclysme et la Peste Magique, toucha alors le monde... L'Orbe de Tour, le cœur de la Tour Noire, la source d'énergie de l'Overlord, a implosé en détruisant la Tour... Ainsi qu'une bonne partie de l'ancien Royaume...(ces Terres sont désormais appelés les Terres Incultes)",
     "Aderia, joyau de Gaïa, est un monde incroyablement vivant. Au-delà des cieux trône Aura, royaume de la lumière et de l'inspiration. Aux confins de l'Outremonde se trouve Pandémonium, royaume des morts et demeure des démons du chaos. Entre les deux se trouve Terra, fief de l'Humanité et des mortels où les énergies belles et maléfiques des deux royaumes se rencontrent et s'affrontent.Les habitants de Terra sont avant tout des artistes. Certains utilisent le chant pour faire vibrer la magie, d'autres créent d'improbables machines ; même les pirates ont la fibre créative. Depuis des siècles, la Basilique de Navéa célèbre le cube de Gaïa par des rites et des fêtes ; elle est le garant du lien qui unit le monde des mortels aux forces créatrices de l'univers.",
     "Le jeu se déroule en Calradia, un monde où six factions se livrent des guerres incessantes : les Khergits, les Nords, les Rhodoks, les Sarranides, les Swadians et les Vaegirs.Le jeu livre le joueur à lui-même qui est donc entièrement libre d'opérer comme bon lui semble : devenir marchand, pilleur, esclavagiste, mercenaire, prêter allégeance à un suzerain ou œuvrer pour un prétendant au trône d'une des six factions. Le joueur peut se déplacer librement sur une carte du monde et visiter les villes, les villages et les châteaux sur sa route. Il peut également recruter des soldats pour monter une armée qui l'escorte et combat à ses côtés les bandits et seigneurs ennemis qui parcourent le monde ou pour prendre d'assaut les châteaux et les villes ennemis.",

  ];
  @override
    Widget build(BuildContext context)=>Scaffold(
      body:buildList(),
      );

    Widget buildList()=>ListView.builder(
      
      itemCount: items.length,
      itemExtent:250,
      itemBuilder:(context,index){
        final item=items[index];
        final description=descriptions[index];
        return Container(height: 200, child:ListTile(
          leading:Icon(Icons.favorite),
          title:Text(item,style: TextStyle(fontSize: 40.0),),
          subtitle:Text(description,style: TextStyle(fontSize: 24.0),),
          dense:true,
        ));
      },
    );
}

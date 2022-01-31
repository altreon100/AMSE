import 'package:flutter/material.dart';


class Manga extends StatelessWidget{
  List<String> items= [
     'One Piece',
     'Fairy Tail',
     'Naruto',
     'Seven Deadly Sins',
     'Attack On Titans',
     'Tokyo Ghoul',
  ];

  List<String> descriptions= [
     'Il fut un temps ou Gold Roger etait le plus grand de tous les pirates, le "Roi des Pirates" etait son surnom. A sa mort, son tresor d une valeur inestimable connu sous le nom de "One Piece" fut cache quelque part sur "Grand Line". De nombreux pirates sont partis a la recherche de ce tresor mais tous sont morts avant meme de l atteindre. Monkey D. Luffy reve de retrouver ce tresor legendaire et de devenir le nouveau "Roi des Pirates". Apres avoir mange un fruit du demon, il possede un pouvoir lui permettant de realiser son reve. Il lui faut maintenant trouver un equipage pour partir a l aventure !',
     'Fairy Tail',
     'Naruto',
     'Seven Deadly Sins',
     'Attack On Titans',
     'Tokyo Ghoul',
  ];
  @override
    Widget build(BuildContext context)=>Scaffold(
      body:buildList(),
      );

    Widget buildList()=>ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: items.length,
      itemExtent:200,
      itemBuilder:(context,index){
        final item=items[index];
        final description=descriptions[index];
        return ListTile(
          leading:CircleAvatar(
          backgroundImage:AssetImage('images/$index.jpg'), 
          ),
          title:Text(item,style: TextStyle(fontSize: 40.0),),
          subtitle:Text(description,style: TextStyle(fontSize: 24.0),),
          dense:false,
        );
      },
    );
        
}

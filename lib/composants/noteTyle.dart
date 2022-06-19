import 'package:flutter/material.dart';
import 'package:internote/outils/styles.dart';
import 'dart:math';
import '../outils/constantes.dart';
import 'package:go_router/go_router.dart';

class NoteTyle extends StatelessWidget{
  final String id;
  final String titre;
  const NoteTyle(this.id, this.titre, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    //Todo: Adapter l'affichage du tyle
    return GestureDetector(
      onTap: (){
        context.pushNamed(RouteName.readwrite);
      },
      child: Container(
        height: (Random().nextDouble()+1)*100,
        width: MQ.getLargeur(context)*0.45,
        decoration: BoxDecoration(
          color: Palette.getSombre(1),
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Row(
          children: [
            Text(titre,
              style: StyleDeTexte.getTabTitleStyle(17),
            )
          ],
        ),
      ),
    );
  }
}
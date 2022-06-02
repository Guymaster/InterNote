import 'package:flutter/material.dart';
import 'dart:math';
import '../outils/constantes.dart';

class NoteTyle extends StatelessWidget{
  const NoteTyle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    //Todo: Adapter l'affichage du tyle
    return Container(
      height: (Random().nextDouble()+1)*100,
      width: MQ.getLargeur(context)*0.45,
      decoration: BoxDecoration(
        color: Palette.getSombre(1),
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
    );
  }
}
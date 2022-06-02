import '../composants/noteTyle.dart';
import '../outils/constantes.dart';
import 'package:flutter/material.dart';

class NotesListView extends StatelessWidget{
  late List<Widget> liste;
  static NotesListView getDevView(int nbre){
    List<NoteTyle> liste = [];
    for(int i=1; i<=nbre; i++){
      liste.add(NoteTyle());
    }
    return NotesListView(liste);
  }
  NotesListView(this.liste, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    List<Widget> l1 = [];
    List<Widget> l2 = [];
    for(int i=0; i<liste.length; i++){
      if(i %2==0){
        l2.add(liste[i]);
        l2.add(SizedBox(height: MQ.getLargeur(context)*0.05,));
      }
      else{
        l1.add(liste[i]);
        l1.add(SizedBox(height: MQ.getLargeur(context)*0.05,));
      }
    }
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MQ.getLargeur(context)*0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: l1,
              ),
            ),
            SizedBox(
              width: MQ.getLargeur(context)*0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: l2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
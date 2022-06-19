import 'dart:io';

import 'package:localstorage/localstorage.dart';
import 'package:path_provider/path_provider.dart';
import '../composants/noteTyle.dart';
import '../outils/constantes.dart';
import 'package:flutter/material.dart';

class NotesListView extends StatelessWidget{
  late List<Widget> liste;
  static Future<NotesListView> getRecentsView() async{
    final Directory directory = await getApplicationDocumentsDirectory();
    final String directoryPath = directory.path;
    File noteTreeRef = File('$directoryPath/note_tree.json');
    String ntrContent = await noteTreeRef.readAsString();
    List<Widget> noteList = [];
    List<Map> tempList = [];
    List<String> refList = [];
    //Let's search all note refs
    print('Lets search all note refs');
    LocalStorage storage = LocalStorage("note_tree.json");
    List hierarchy = storage.getItem("hierarchy");
    print('longueur de hierachy: ${hierarchy.length}');
    for (Map folder in hierarchy) {
      folder["content"].forEach((noteRef){
        refList.add(noteRef);
      });
    }
    //Let's get all notes by refs
    print('get all notes by refs');
    for (String ref in refList) {
      LocalStorage note = LocalStorage("$ref.json");
      tempList.add({
        "id": note.getItem("id"),
        "titre": note.getItem("titre")
      });
    }
    //ToDo: Limiter (par date) la recherche des notes récentes
    for (Map noteTyleMap in tempList){
      noteList.add(NoteTyle(noteTyleMap["id"], noteTyleMap["titre"]));
    }
    print('Pas Dev mais OK');
    return  NotesListView(noteList);
  }
  static NotesListView getDevView(int nbre){
    print('Si Dev');
    List<NoteTyle> liste = [];
    for(int i=1; i<=nbre; i++){
      liste.add(NoteTyle("NOTETEST $i", "Titre Test $i"));
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
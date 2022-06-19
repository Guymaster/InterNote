import 'package:flutter/material.dart';
import 'package:internote/treatment/noteTree.dart';
import 'package:localstorage/localstorage.dart';

Future<bool> initApp(BuildContext context) async{
  bool exists = await doNoteTreeExists();
  print('Exist0: $exists');
  bool newUser = !exists;
  while(exists == false){
    exists = await doNoteTreeExists();
    if(!exists) await createNoteTree();
  }
  Future.delayed(Duration(seconds: 2), (){
     print('Nouvel Utilisateur: $newUser');
  });
  return newUser;
}
import 'package:flutter/material.dart';
import 'package:internote/treatment/noteTree.dart';
import 'package:localstorage/localstorage.dart';

Future<String> initApp(BuildContext context) async{
  String str;
  bool newUser = doNoteTreeExists();
  str = await Future.delayed(Duration(seconds: 5), (){
     return 'on est à 3 $newUser';
  });
  return str;
}
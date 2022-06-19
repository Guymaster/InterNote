import 'dart:convert';
import 'dart:io';

import 'package:localstorage/localstorage.dart';
import 'package:path_provider/path_provider.dart';

Future<bool> doNoteTreeExists() async{
  final Directory directory = await getApplicationDocumentsDirectory();
  final String directoryPath = directory.path;
  File noteTreeRef = File('$directoryPath/note_tree.json');
  String ntrContent = await noteTreeRef.readAsString();
  bool ntrExists = noteTreeRef.existsSync();
  if(ntrExists && noteTreeRef.readAsStringSync().isNotEmpty){
    return true;
  }else{
    return false;
  }
}


Future<void> createNoteTree() async{
  final Directory directory = await getApplicationDocumentsDirectory();
  final String directoryPath = directory.path;
  File noteTreeRef = File('$directoryPath/note_tree.json');
  Map noteTree = {
    "hierarchy": [
      {
        "path": "/",
        "content": [
          "default_note"
        ]
      }
    ]
  };
  noteTreeRef.writeAsString(jsonEncode(noteTree));
    //${jsonDecode(noteTreeRef.readAsStringSync())}
  File defaultNoteRef = File('$directoryPath/default_note.json');
  Map defaultNote = {
    "id": "DEFAULT_NOTE",
    "titre": "Note de Bienvenue"
  };
  defaultNoteRef.writeAsString(jsonEncode(defaultNote)); //ToDo: Terminer la creation de la DefaultNote

}
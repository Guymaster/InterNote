import 'package:localstorage/localstorage.dart';
import 'package:mac_address/mac_address.dart';

bool doNoteTreeExists(){
  LocalStorage storage = LocalStorage("note_tree.json");
  var id = storage.getItem("hierarchy");
  createNoteTree();
  if(id != null){
    return true;
  }else{
    return false;
  }
}

Future<void> createNoteTree() async{
  String deviceID = await GetMac.macAddress;
  print('ID $deviceID');
}
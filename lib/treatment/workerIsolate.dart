import 'dart:isolate';

void execWorking(SendPort mainSendPort){
  //execWorking est l'isolate d'arriere plan
  ReceivePort workingReceivePort = ReceivePort(); //On se crée un ReceivePort
  mainSendPort.send(workingReceivePort.sendPort); //On envoie notre sendPort comme premier message au main
  workingReceivePort.listen((message) { //On attend le coup d'envoi de isoMain
    if(message == 'START_WORKING'){
      mainSendPort.send("OK JE TRAVAILLE");
    }
  });
  while(true){
    Future.delayed(Duration(seconds: 3), (){
      print("3 sedondes de plus");
    });
  }
}
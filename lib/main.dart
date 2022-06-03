import './outils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'outils/constantes.dart';

void main() {
  //ToDo: Mettre en place un système multithread (Ui et traitement)
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Palette.getNoir(1),
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CustomRouter>(
          lazy: false,
          create: (BuildContext context) => CustomRouter(),
        )
      ],
      child: Builder(
        builder: (BuildContext context){
          final router = Provider.of<CustomRouter>(context, listen: false).router;
          return MaterialApp.router(
              routeInformationParser: router.routeInformationParser,
              routerDelegate: router.routerDelegate,
            debugShowCheckedModeBanner: false,
            title: 'InterNote',
            theme: CustomTheme.getDefault(),
          );
        },
      )
    );
  }
}

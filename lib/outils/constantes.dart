import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../main.dart';
import '../pages/home.dart';

abstract class Palette{
  static Color getBlanc(double o) => Color.fromRGBO(219, 218, 228, o);
  static Color getSombre(double o) => Color.fromRGBO(46, 47, 64, o);
  static Color getNoir(double o) => Color.fromRGBO(26, 26, 38, o);
  static Color getMarron(double o) => Color.fromRGBO(185, 150, 74, o);
  static Color getBleu(double o) => Color.fromRGBO(107, 111, 191, o);
}

abstract class MQ{
  static double getHauteur(BuildContext context) => MediaQuery.of(context).size.height;
  static double getLargeur(BuildContext context) => MediaQuery.of(context).size.width;
}

class CustomRouter{
  late GoRouter router = GoRouter(
    routes: routes,
    errorPageBuilder: (context, state) => const MaterialPage<void>(
        child: MyHomePage(title: 'Erreur',)
    ),
    urlPathStrategy: UrlPathStrategy.hash
  );
  List<GoRoute> routes = [
    GoRoute(
      path: '/',
      name: RouteName.root,
      pageBuilder: (context, state) => const MaterialPage<void>(
        child: MyHomePage(title: 'Root',)
      )
    ),
    GoRoute(
        path: '/home',
        name: RouteName.home,
        pageBuilder: (context, state) => const MaterialPage<void>(
            child: Home()
        )
    ),
    GoRoute(
        path: '/params',
        name: RouteName.params,
        pageBuilder: (context, state) => const MaterialPage<void>(
            child: MyHomePage(title: 'Params',)
        )
    ),
    GoRoute(
        path: '/add',
        name: RouteName.add,
        pageBuilder: (context, state) => const MaterialPage<void>(
            child: MyHomePage(title: 'Add',)
        )
    ),
  ];
}

abstract class RouteName{
  static const String root = 'root';
  static const String home = 'home';
  static const String params = 'params';
  static const String add = 'add';
}
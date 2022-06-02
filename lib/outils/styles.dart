import 'package:flutter/material.dart';
import 'constantes.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class StyleDeTexte{
  static TextStyle getLeadingTextStyle() => GoogleFonts.novaRound(
    textStyle: TextStyle( //Style pour les entetes de page
        color: Palette.getBlanc(1),
        fontWeight: FontWeight.bold,
        fontSize: 20
    )
  );

  static TextStyle getDocTextStyle(double size) => TextStyle( //Style pour les titres d'item document
      color: Palette.getBlanc(1),
      fontWeight: FontWeight.bold,
      fontSize: size
  );

  static TextStyle getTabTitleStyle(double size) => GoogleFonts.lato(
    textStyle: TextStyle( //Style pour les titres d'item document
        color: Palette.getBlanc(.6),
        fontWeight: FontWeight.bold,
        fontSize: size
    )
  );

  static TextStyle getTabTitleSelectedStyle(double size) => GoogleFonts.lato(
    textStyle: TextStyle( //Style pour les titres d'item document
        color: Palette.getMarron(1),
        fontWeight: FontWeight.bold,
        fontSize: size
    )
  );
}

abstract class StyleDeBTN{
  static ButtonStyle getHomeActionBTNStyle() => ButtonStyle(
    shape: MaterialStateProperty.resolveWith((states){
      return const CircleBorder();
    }),
    backgroundColor: MaterialStateColor.resolveWith((states){
      if(states.contains(MaterialState.pressed)){
        return Palette.getSombre(0.8);
      }
      else{
        return Palette.getNoir(1);
      }
    }),
  );
  static ButtonStyle getHomeFloatingBTNStyle() => ButtonStyle(
    backgroundColor: MaterialStateColor.resolveWith((states){
      if(states.contains(MaterialState.pressed)){
        return Palette.getBleu(1);
      }
      else{
        return Palette.getBleu(0.7);
      }
    }),
  );
}

class CustomTheme{
  static getDefault(){
    Color swatchColor = Palette.getNoir(1);
    String swatchStr = swatchColor.toString().split('(0x')[1].split(')')[0];
    int swatchInt = int.parse(swatchStr, radix: 16);
    Map<int, Color> swatchMap =
    {
      50:Palette.getNoir(.1),
      100:Palette.getNoir(.2),
      200:Palette.getNoir(.3),
      300:Palette.getNoir(.4),
      400:Palette.getNoir(.5),
      500:Palette.getNoir(.6),
      600:Palette.getNoir(.7),
      700:Palette.getNoir(.8),
      800:Palette.getNoir(.9),
      900:Palette.getNoir(1),
    };

    return ThemeData(
        primarySwatch: MaterialColor(
          swatchInt,
          swatchMap
        ),
        primaryColor: Palette.getBleu(1),
        scaffoldBackgroundColor: Palette.getNoir(1),
        textTheme: ThemeData.dark().textTheme
    );
  }
}
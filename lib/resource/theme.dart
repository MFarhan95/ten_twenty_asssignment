import 'package:flutter/material.dart';
import 'package:ten_twenty_asssignment/resource/resource.dart';

ThemeData theme() {
  return ThemeData(
      bottomAppBarColor: const Color.fromRGBO(46, 39, 57, 1),
      scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      backgroundColor: const Color.fromRGBO(239, 239, 239, 1),
      cardColor: const Color.fromRGBO(226, 108, 165, 1),
      primaryColorLight: const Color.fromRGBO(130, 125, 136, 1),
      canvasColor: const Color.fromRGBO(21, 210, 188, 1),
      dividerColor: const Color.fromRGBO(0, 0, 0, 1),
      fontFamily: 'Poppins',
      textTheme: const TextTheme(
        headline1: TextStyle(
            color: Color.fromRGBO(32, 54, 67, 1),
            fontWeight: FontWeight.w500,
            fontSize: 20,
            fontFamily: Assets.poppinsBold),
        headline2: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontWeight: FontWeight.w500,
            fontSize: 18,
            fontFamily: Assets.poppinsBold),
        headline3: TextStyle(
            color: Color.fromRGBO(32, 54, 67, 0.3),
            fontWeight: FontWeight.w400,
            fontSize: 14,
            fontFamily: Assets.poppinsBold),
        headline4: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontWeight: FontWeight.w500,
            fontSize: 16,
            fontFamily: Assets.poppinsBold),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(

          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(97, 195, 242, 1),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  fontStyle: FontStyle.normal))),

    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(15),
          textStyle: const TextStyle(
            fontSize: 16,
            color: Colors.white
          ),
        )),



  );


}

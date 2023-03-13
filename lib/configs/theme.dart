import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  backgroundColor: const Color(0xff2d2d2d),
  colorScheme:  ColorScheme.fromSwatch().copyWith(
    secondary: const Color(0xff009afc),tertiary: const Color(0xfffefffe),
  ),
  hintColor: const Color(0xffb8b9c2),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontSize: 40,color: Color(0xfffefffe),),
    headlineMedium: TextStyle(fontSize: 22,color: Color(0xfffefffe),),
    headlineSmall: TextStyle(fontSize: 20,color: Color(0xfffefffe),),
    bodyMedium: TextStyle(fontSize: 20,color: Color(0xfffefffe),),
    bodySmall: TextStyle(fontSize: 18,color: Color(0xfffefffe),),
  ),
  fontFamily: "Linden Hill"
);
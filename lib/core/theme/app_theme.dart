import 'package:flutter/material.dart';

class AppTheme {
static const Color primary=Color(0xff252525);
static const Color white=Color(0xffFFFFFF);
static const Color gray=Color(0xff9A9A9A);
static const Color pink=Color(0xffFD99FF);
static const Color orange=Color(0xffFF9E9E);
static const Color green=Color(0xff91F48F);
static const Color yellow=Color(0xffFFF599);
static const Color lightBlue=Color(0xff9EFFFF);
static const Color purple=Color(0xffB69CFF);
static ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: primary,
  appBarTheme: AppBarTheme(
    backgroundColor: primary,
    titleTextStyle: TextStyle(color: white, fontSize: 43,fontWeight: FontWeight.w600,),

  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: primary, fontSize: 25, fontWeight: FontWeight.w400),
    displayLarge: TextStyle(color: gray, fontSize: 48, fontWeight: FontWeight.w400),
  ),

);




}
import 'package:ek/core/mangers/colors.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3:false,
  appBarTheme:  AppBarTheme(
    titleSpacing: 20.0,
    backgroundColor: AppColorsDarkTheme.scaffoldBackGroundColor,
    elevation: 0.0,
    titleTextStyle:const TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme:const  IconThemeData(
      color: Colors.white,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.indigo,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.yellow,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: HexColor('333739'),
  ),
  textTheme: const TextTheme(
    labelMedium: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0,
      color: Colors.white,
    ),
  ),
  scaffoldBackgroundColor:AppColorsDarkTheme.scaffoldBackGroundColor
);

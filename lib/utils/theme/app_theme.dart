import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/home/home_bloc.dart';

import '../color_constants.dart';

enum ThemeSize { BIG, MEDIUM, SMALL }
enum ThemeLayoutType { WEB, ANDROID, IOS }

class AppTheme {
  final ThemeData kIOSTheme = ThemeData(
    primarySwatch: AppTheme.colorPrimary,
    primaryColor: Colors.grey[100],
    primaryColorBrightness: Brightness.light,
    backgroundColor: AppTheme.colorPrimary,
  );

  final ThemeData kWebTheme = ThemeData(
    primarySwatch: Colors.purple,
    accentColor: AppTheme.colorPrimary,
    backgroundColor: Colors.blue,
  );

  final ThemeData kAndroidTheme = ThemeData(
    primarySwatch: Colors.purple,
    accentColor: AppTheme.colorPrimary,
    backgroundColor: Colors.yellow,
  );



  static ThemeLayoutType typeTheme(BuildContext context) =>

      Theme.of(context ?? meuContextoGlobal).platform == TargetPlatform.iOS
          ? ThemeLayoutType.ANDROID
          :
//      Theme.of(context).platform == TargetPlatform.android
//              ? ThemeLayoutType.ANDROID
//              :

          MediaQuery.of(context ?? meuContextoGlobal).size.width < 600
              ? ThemeLayoutType.ANDROID
              : ThemeLayoutType.WEB;

  static TextStyle bigBoldSize({Color color}) => TextStyle(
      decoration: TextDecoration.none,
      fontFamily: 'Roboto',
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: color ?? Colors.grey[800]);

  static TextStyle bigSize({Color color}) => TextStyle(
      decoration: TextDecoration.none,
      fontFamily: 'Roboto',
      fontSize: 22,
      color: color ?? Colors.grey[800]);

  static TextStyle normalBoldSize({Color color}) => TextStyle(
      decoration: TextDecoration.none,
      fontFamily: 'Roboto',
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: color ?? Colors.grey[700]);

  static TextStyle normalSize({Color color}) => TextStyle(
      decoration: TextDecoration.none,
      fontFamily: 'Roboto',
      fontSize: 16,

      color: color ?? Colors.grey[700]);

  static TextStyle smallSize({Color color}) => TextStyle(
      decoration: TextDecoration.none,
      fontFamily: 'Roboto',
      fontSize: 14,
      color: color ?? Colors.grey[700]);

  static Color colorPrimary =  HexColor("2e1715");
  static Color whiteColor = Colors.white;
  static Color colorSucess = Colors.green;
  static Color colorError = AppTheme.colorPrimary;
  static Color lightGray = Colors.grey;
}



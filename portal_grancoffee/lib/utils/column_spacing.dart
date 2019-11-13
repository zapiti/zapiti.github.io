import 'package:flutter/material.dart';

double columnSpacingBottomInitial(context) {
  return MediaQuery.of(context).size.width > 1340 ||
      MediaQuery.of(context).size.width > 1050 &&
          MediaQuery.of(context).size.width < 1100
      ? MediaQuery.of(context).size.width *
      (MediaQuery.of(context).size.width / 22500)
      : MediaQuery.of(context).size.width *
      (MediaQuery.of(context).size.width / 7500);
}
double columnSpacingDefault(context){
  return  MediaQuery.of(context).size.width * (MediaQuery.of(context).size.width / 20500);

}
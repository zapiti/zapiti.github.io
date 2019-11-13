import 'package:flutter/material.dart';

PhysicalModel circleCheckViewWidget(
    {bool containsCenter = true,
      Color colorLine = Colors.green,
      Color colorContent = Colors.white}) {
  return PhysicalModel(
    borderRadius: new BorderRadius.circular(35.0),
    color: containsCenter ? colorContent : Colors.transparent,
    child: new Container(
      width: 70.0,
      height: 70.0,
      child: containsCenter
          ? Icon(
        Icons.check,
        color: colorLine,
        size: 40,
      )
          : SizedBox(),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(35.0),
        border: new Border.all(
          width: 1.0,
          color: colorLine,
        ),
      ),
    ),
  );
}
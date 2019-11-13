
import 'package:flutter/material.dart';

Widget lineViewWidget({Color color,double width = 1000,double boarder = 0}) {
  return Container(
    margin: EdgeInsets.only(right: boarder,left: boarder),
    color: color ?? Colors.grey[300],
    width: width,
    height: 1,
  );
}

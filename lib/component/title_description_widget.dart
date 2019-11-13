
import 'package:flutter/material.dart';

Row titleDescriptionWidget({String title, String description}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,

    children: <Widget>[
      SizedBox(
        width: 30,
      ),
      Text(title, style: TextStyle(color: Colors.grey[400])),
      SizedBox(width: 10),

      Expanded(
       child:
          Text(description, style: TextStyle(), overflow: TextOverflow.ellipsis)
      )

    ],
  );
}

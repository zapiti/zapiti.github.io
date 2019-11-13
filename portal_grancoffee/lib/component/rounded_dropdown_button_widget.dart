import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget roundedDropdownButtonWidget(
    {String selectedElement,
      List<String> listElements,
      String hint,
      ValueChanged changeElement}) {
  return Container(
    height: 40.0,
    padding: EdgeInsets.only(left: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: Colors.grey[300])),
    child: Center(
      child: DropdownButton<String>(
        underline: SizedBox(),
        hint: Text(hint),
        items: listElements.map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        onChanged: (element) {
          changeElement(element);
        },
      ),
    ),
  );
}

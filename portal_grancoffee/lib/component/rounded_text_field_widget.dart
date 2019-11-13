import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget roundedTextFieldWidget({TextEditingController controller, String hint}) {
  return Container(
    padding: EdgeInsets.only(left: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: Colors.grey[300])),
    child: TextField(
      controller: controller,
      decoration: new InputDecoration.collapsed(hintText: hint),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';

List<Widget> horizontalListImageWidget({List<String> listImage}) {
  return <Widget>[
    Container(width: 50, height: 50, color: AppTheme.colorPrimary),
    SizedBox(
      width: 10,
    ),
    Container(width: 50, height: 50, color: AppTheme.colorPrimary),
    SizedBox(
      width: 10,
    ),
    Container(width: 50, height: 50, color: AppTheme.colorPrimary),
    SizedBox(
      width: 10,
    ),
    Container(width: 50, height: 50, color: AppTheme.colorPrimary),
    SizedBox(
      width: 10,
    ),
  ];
}


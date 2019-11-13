import 'package:flutter/material.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';
import 'package:portal_grancoffee/component/line_view_widget.dart';

Widget simpleTitleDescriptionColor(
    {String title, String description, Color color, bool containsLine = true}) {
  return Column(
    children: <Widget>[
      Text(
        title,
        style: description != null
            ? AppTheme.normalSize(color: color)
            : AppTheme.smallSize(color: Colors.grey[400]),
      ),
      description != null ?   Text(
        description ,
        style: AppTheme.smallSize(color: Colors.grey[400]),
      ) : SizedBox(),
      SizedBox(
        height:  containsLine ? 12 :0,
      ),
      containsLine ? lineViewWidget() : SizedBox()
    ],
  );
}

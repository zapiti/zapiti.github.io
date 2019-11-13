import 'package:flutter/material.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';
import 'package:portal_grancoffee/component/circle_check_view_widget.dart';

import 'line_view_widget.dart';

Widget circleTimeLineViewWidget(
    {@required String title,
      String description,
      Color colorLine = Colors.green,
      bool isFirst = false,
      bool isLast = false}) {
  return Column(
    children: <Widget>[
      Row(
        children: <Widget>[
          lineViewWidget(
              width: 60, color: isFirst ? Colors.transparent : colorLine),
          circleCheckViewWidget(
              containsCenter: description != null, colorLine: colorLine),
          lineViewWidget(
              width: 60, color: isLast ? Colors.transparent : colorLine)
        ],
      ),
      Text(
        title,
        style: AppTheme.normalSize(color: colorLine),
      ),
      Text(
        description ?? "---",
        style: AppTheme.smallSize(color: Colors.grey[400]),
      )
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';

import 'line_view_widget.dart';

Widget titleDescriptionMobileWidget(
    {String title, String description, GestureTapCallback action}) {
  return InkWell(
    onTap: action,
    child: Column(
      children: <Widget>[
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title, style: AppTheme.normalSize()),
                Text(description,
                    style: AppTheme.normalSize(color: Colors.grey[400]),
                  ),
              ],
            )),
            SizedBox(width: 10),
            action != null ? Icon(Icons.keyboard_arrow_right) : SizedBox(),
            SizedBox(width: 20),
          ],
        ),
        SizedBox(height: 10),
        lineViewWidget(boarder: 20)
      ],
    ),
  );
}

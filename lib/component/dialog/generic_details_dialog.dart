import 'package:flutter/material.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';
import 'package:portal_grancoffee/component/line_view_widget.dart';

import 'default_close_dialog_widget.dart';

Widget genericDetailsDialog(BuildContext context,
    {double width,
    double height,
    String title,
    Widget bodyWidget,
    Widget bottomWidget,
    VoidCallback closeDialog}) {
  return Center(
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
                width: width ?? 800,
                height: height ?? 450,
                child: Card(
                    color: Colors.grey[50],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: Text(
                                title,
                                style: AppTheme.normalSize(),
                              )),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Icon(Icons.close))
                            ],
                          ),
                        ),
                        lineViewWidget(),
                        Container(
                          color: Colors.white,
                          child: bodyWidget,
                        ),
                        lineViewWidget(),
                        Container(
                          child: Expanded(
                              child: bottomWidget ??
                                  defaultCloseDialogWidget(
                                      context, closeDialog)),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                      ],
                    ))),
          )));
}

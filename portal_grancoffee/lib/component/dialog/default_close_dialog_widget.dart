import 'package:flutter/material.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';

Row defaultCloseDialogWidget(BuildContext context, VoidCallback closeDialog) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    mainAxisAlignment: MainAxisAlignment.end,
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      FlatButton(
          color: AppTheme.colorPrimary,
          child: Text("Fechar", style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.of(context).pop();
            closeDialog();
          },
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
              side: BorderSide(color: AppTheme.colorPrimary))),
      SizedBox(
        width: 10,
      ),
      SizedBox(
        width: 10,
      ),
    ],
  );
}

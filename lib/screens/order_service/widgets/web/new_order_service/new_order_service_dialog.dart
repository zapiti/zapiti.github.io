import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';
import 'package:portal_grancoffee/component/circular_border_widget.dart';
import 'package:portal_grancoffee/component/dialog/generic_details_dialog.dart';
import 'package:portal_grancoffee/component/rounded_dropdown_button_widget.dart';
import 'package:portal_grancoffee/component/rounded_text_field_widget.dart';

void showNewOrderServiceDialog(BuildContext context) {
  showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return genericDetailsDialog(context,
            width: 800,
            height: 520,
            title: "Nova ordem de serviço",
            bodyWidget: generateNewOrderServiceDialog(),
            bottomWidget: bottomNewOrderDialog(context));
      });
}

Row bottomNewOrderDialog(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    mainAxisAlignment: MainAxisAlignment.end,
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      FlatButton(
          child: Text("Cancelar", style: TextStyle(color: AppTheme.colorPrimary)),
          onPressed: () {
            Navigator.of(context).pop();
          },
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
              side: BorderSide(color: AppTheme.colorPrimary))),
      SizedBox(
        width: 10,
      ),
      FlatButton(
          child: Text(
            "Salvar",
            style: TextStyle(color: Colors.white),
          ),
          color: AppTheme.colorPrimary,
          onPressed: () {},
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
              side: BorderSide(color: AppTheme.colorPrimary))),
      SizedBox(
        width: 10,
      ),
    ],
  );
}

Column generateNewOrderServiceDialog() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      SizedBox(
        height: 20,
      ),
      Container(
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: roundedDropdownButtonWidget(
                  selectedElement: "Messaging",
                  hint: "Messaging",
                  listElements: <String>[
                    'Messaging',
                    'Chating',
                    'No Longer Interested',
                    'Document Request'
                  ],
                  changeElement: (element) {}),
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: roundedDropdownButtonWidget(
                  selectedElement: "Messaging",
                  hint: "Messaging",
                  listElements: <String>[
                    'Messaging',
                    'Chating',
                    'No Longer Interested',
                    'Document Request'
                  ],
                  changeElement: (element) {}),
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: roundedDropdownButtonWidget(
                  selectedElement: "Messaging",
                  hint: "Messaging",
                  listElements: <String>[
                    'Messaging',
                    'Chating',
                    'No Longer Interested',
                    'Document Request'
                  ],
                  changeElement: (element) {}),
            ),
            SizedBox(
              width: 30,
            ),
          ],
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Container(
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: roundedTextFieldWidget(hint:"E-mail"),
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: roundedTextFieldWidget(hint:"Tel. de contato"),
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: roundedTextFieldWidget(hint:"Tel. de contato adicional" ),
            ),
            SizedBox(
              width: 30,
            ),
          ],
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Container(
        margin: EdgeInsets.only(right: 30, left: 30),
        child: TextField(
          maxLines: 5,
          decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                // width: 0.0 produces a thin "hairline" border
                borderSide: BorderSide(color: Colors.grey, width: 0.0),
              ),
              hintText: "Descreva o problema",
              border: OutlineInputBorder(),
              fillColor: Colors.grey[300]),
        ),
      ),
      Container(
        margin: EdgeInsets.only(right: 30, left: 30, top: 20),
        child: Row(
          children: <Widget>[
            Text(
              "Deseja anexar alguma evidênca?",
              style: AppTheme.smallSize(),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Tamanho máximo: 2MB | Formatos:.jpg,.pdf e .png",
              style: AppTheme.smallSize(color: Colors.grey[300]),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 30, top: 20),
        child: InkWell(
          child: CircularBorderWidget(
            color: Colors.black,
            width: 1,
            size: 50,
            child: Icon(Icons.add),
          ),
          onTap: () {},
        ),
      ),
      SizedBox(
        height: 20,
      ),
    ],
  );
}

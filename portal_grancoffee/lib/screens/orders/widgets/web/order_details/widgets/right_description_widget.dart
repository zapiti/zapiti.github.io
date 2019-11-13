
import 'package:flutter/material.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';
import 'package:portal_grancoffee/component/title_description_widget.dart';

Container rightDescriptionWidget() {
  return Container(
    width: 370,
    height: 320,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        Text(
          "Detalhes",
          style: AppTheme.normalSize(),
        ),
        SizedBox(
          height: 5,
        ),
        titleDescriptionWidget(
            title: "Data de criação:", description: "03/10/2019"),
        SizedBox(
          height: 5,
        ),
        titleDescriptionWidget(
            title: "Previsão de entrega:", description: "11/10/2019"),
        SizedBox(
          height: 5,
        ),
        titleDescriptionWidget(
            title: "Planta:", description: "Rua José Manuel Filho,312"),
        SizedBox(
          height: 5,
        ),
        titleDescriptionWidget(title: "Máquina:", description: "CMKS0001259"),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 5,
        ),
        Text("Observações:", style: AppTheme.normalSize()),
        SizedBox(
          height: 5,
        ),
        Text(
          "Lorem ipsum dolor sit amet conser Lorem ipsum dolor "
              "sit amet conser Lorem ipsum dolor sit amet"
              " conser Lorem ipsum dolor sit amet conser",
          maxLines: 10,
        ),
      ],
    ),
  );
}
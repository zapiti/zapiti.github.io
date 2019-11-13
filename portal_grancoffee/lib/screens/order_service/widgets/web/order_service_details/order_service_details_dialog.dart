import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';
import 'package:portal_grancoffee/component/dialog/generic_details_dialog.dart';
import 'package:portal_grancoffee/component/horizontal_list_image_widget.dart';
import 'package:portal_grancoffee/component/title_description_widget.dart';

void showDetailsOrderServiceDialog(BuildContext context) {
  showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return genericDetailsDialog(context,
            title: "Ordem de serviço", bodyWidget: generateBodyDetailsDialog());
      });
}

Row generateBodyDetailsDialog() {
  return Row(
    children: <Widget>[
      Expanded(
          child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          titleDescriptionWidget(title: "OS: ", description: "121245"),
          SizedBox(
            height: 10,
          ),
          titleDescriptionWidget(title: "Data: ", description: "11/10/2019"),
          SizedBox(
            height: 10,
          ),
          titleDescriptionWidget(
              title: "Patrimônio: ", description: "Conteudo patrimonio"),
          SizedBox(
            height: 10,
          ),
          titleDescriptionWidget(
              title: "Planta: ", description: "Rua José Manuel, 312"),
          SizedBox(
            height: 10,
          ),
          titleDescriptionWidget(
              title: "Motivo: ", description: "Falta de abastecimento"),
          SizedBox(
            height: 10,
          ),
          titleDescriptionWidget(
              title: "E-mail: ", description: "emaildocliente@empresa1.com.br"),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 30,
              ),
              Text("Status:", style: TextStyle(color: Colors.grey[400])),
              SizedBox(width: 10),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 12.0,
                      height: 12.0,
                      margin: EdgeInsets.only(right: 5),
                      decoration: new BoxDecoration(
                        color: false ? Colors.green : Colors.yellow,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text("Pendente")
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 140,
          ),
        ],
      )),
      Expanded(
        child: Container(
            height: 320,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Problema:",
                  style: AppTheme.normalBoldSize(),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing"
                  "Lorem Ipsum is simply dummy text of the printing",
                  maxLines: 9,
                  style: AppTheme.smallSize(),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Anexos:",
                  style: AppTheme.normalBoldSize(),
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  child: Row(
                    children: horizontalListImageWidget(),
                  ),
                  scrollDirection: Axis.horizontal,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )),
      )
    ],
  );
}

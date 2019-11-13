import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';
import 'package:portal_grancoffee/component/line_view_widget.dart';

List<Widget> productItemList({List<String> listProducts}) {
  List<Widget> newList = listProducts.map((String list) {
    return Container(
        margin: EdgeInsets.only(right: 10, left: 10),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Expanded(
                  child: Container(
                    height: 20,
                    margin: EdgeInsets.only(top: 5, left: 10, bottom: 5),
                    child: Text(
                      "Quantidade: 3",
                      style: AppTheme.smallSize(),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  margin: EdgeInsets.only(right: 10, top: 5, bottom: 5),
                  child: Text("Unidade: Cx", style: AppTheme.smallSize()),
                )
              ]),
              lineViewWidget(),
              Container(
                margin: EdgeInsets.all(10),
                child: Text("Nome do produto numero 1",
                    style: AppTheme.smallSize()),
              ),
              lineViewWidget(),
              Row(children: [
                Expanded(
                  child: Container(
                    height: 20,
                    margin: EdgeInsets.only(top: 5, left: 10, bottom: 5),
                    child: Text(
                      "Valor unit: R\$150,00",
                      style: AppTheme.smallSize(color: Colors.grey[500]),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  margin: EdgeInsets.only(right: 10, top: 5, bottom: 5),
                  child: Text("Valor total: R\$550,00",
                      style: AppTheme.smallSize(color: Colors.green)),
                )
              ])
            ],
          ),
        ));
  }).toList();

  return newList;
}

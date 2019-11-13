import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

import 'package:portal_grancoffee/component/circle_timelime_view_widget.dart';
import 'package:portal_grancoffee/component/dialog/generic_details_dialog.dart';
import 'package:portal_grancoffee/component/line_view_widget.dart';
import 'package:portal_grancoffee/screens/orders/widgets/web/order_details/widgets/right_description_widget.dart';


import 'widgets/left_description_widget.dart';

void showOrderDetailsDialog(BuildContext context) {
  showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return genericDetailsDialog(context,
            width: 950,
            height: 560,
            title: "Detalhes do pedido",
            bodyWidget: generateOrderDetailsDialog());
      });
}

Widget generateOrderDetailsDialog() {
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            color: Colors.grey[200],
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: lineViewWidget(color: Colors.transparent),
                    ),
                    circleTimeLineViewWidget(
                        title: "Solicitação realizada",
                        description: "11/10/2019 ás 13:30",
                        colorLine: Colors.green,
                        isFirst: true),
                    circleTimeLineViewWidget(
                      title: "Pedido aprovado",
                      description: "11/10/2019 ás 13:30",
                      colorLine: Colors.green,
                    ),
                    circleTimeLineViewWidget(
                      title: "Em transporte",
                      description: null,
                      colorLine: Colors.grey[400],
                    ),
                    circleTimeLineViewWidget(
                        title: "Entregue",
                        description: null,
                        colorLine: Colors.grey[400],
                        isLast: true),
                    Expanded(
                      child: lineViewWidget(color: Colors.transparent),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                )
              ],
            )),
        Row(
          children: <Widget>[
            Container(
                height: 300,
                width: 550,
                child: Scrollbar(child: leftDescriptionWidget())),
            SizedBox(
              width: 15,
            ),
            rightDescriptionWidget()
          ],
        ),
      ]);
}

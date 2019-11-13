import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/navbar/nav_bar_bloc.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';
import 'package:portal_grancoffee/component/time_line_widget.dart';
import 'package:portal_grancoffee/component/title_descritption_mobile_widget.dart';
import 'package:portal_grancoffee/models/order/order.dart';
import 'package:portal_grancoffee/screens/orders/widgets/mobile/widgets/product_item_list.dart';
import 'package:portal_grancoffee/screens/orders/widgets/mobile/widgets/simple_title_description_color.dart';

class OrderDetailsMobilePage extends StatelessWidget {
  final Order order;

  OrderDetailsMobilePage({this.order});

  @override
  Widget build(BuildContext context) {
    blocNavBar.seShowHideNav(false);

    return WillPopScope(
        onWillPop: () async {
          blocNavBar.seShowHideNav(true);
          return true;
        },
        child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: AppTheme.colorPrimary),
              backgroundColor: Colors.white,
              title: Text(
                "Detalhe do pedido",
                style: TextStyle(
                  fontSize: 24,
                  color: AppTheme.colorPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: SingleChildScrollView(
                padding: EdgeInsets.all(0),
                child: Column(children: <Widget>[
                  SizedBox(
                    height: 12,
                  ),
                  Card(
                    child: TimelineWidget(
                      isLeftAligned: true,
                      children: <Widget>[
                        Container(
                            child: simpleTitleDescriptionColor(
                                title: "Solicitação realizada",
                                description: "11/10/2019 ás 13:30",
                                color: Colors.green)),
                        Container(
                          child: simpleTitleDescriptionColor(
                              title: "Pedido aprovado",
                              description: "11/10/2019 ás 13:30",
                              color: Colors.green),
                        ),
                        Container(
                            height: 30,
                            child: simpleTitleDescriptionColor(
                                title: "Em transporte")),
                        Container(
                            height: 30,
                            child: simpleTitleDescriptionColor(
                                title: "Entregue", containsLine: false)),
                      ],
                      indicators: <Widget>[
                        Icon(
                          Icons.inbox,
                          color: Colors.green,
                        ),
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                        Icon(
                          Icons.directions_car,
                          size: 10,
                        ),
                        Icon(
                          Icons.markunread_mailbox,
                          size: 10,
                        ),
                      ],
                    ),
                  ),
                  titleDescriptionMobileWidget(
                    title: "Numero do pedido",
                    description: "${order.numPedido}",
                  ),
                  titleDescriptionMobileWidget(
                      title: "Data de criação", description: "${order.data}"),
                  titleDescriptionMobileWidget(
                      title: "Previão de entrega",
                      description: "${order.previsao}"),
                  titleDescriptionMobileWidget(
                      title: "Planta",
                      description: "Rua José Manuel Filho,312"),
                  titleDescriptionMobileWidget(
                      title: "Máquina", description: "CMKS0001259"),
                  titleDescriptionMobileWidget(
                      title: "Observações",
                      description:
                          "Lorem ipsu dolor sit amet,conse ctetur adipscing elit"),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 20,
                        ),
                        Text("Produtos", style: AppTheme.normalSize()),
                      ]),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: productItemList(listProducts: ["", "", ""]),
                    ),
                    scrollDirection: Axis.vertical,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ]))));
  }
}

void pushToDetailOrder(BuildContext context, Order order) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => OrderDetailsMobilePage(order: order)),
  );
}

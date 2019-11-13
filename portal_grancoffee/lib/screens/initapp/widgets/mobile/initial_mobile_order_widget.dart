import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/home/home_bloc.dart';
import 'package:portal_grancoffee/bloc/initapp/initial_bloc.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';
import 'package:portal_grancoffee/component/line_view_widget.dart';
import 'package:portal_grancoffee/models/order/order.dart';
import 'package:portal_grancoffee/screens/orders/widgets/mobile/order_details/order_details_mobile_page.dart';
import 'package:portal_grancoffee/utils/constants_routes.dart';

Widget initialMobileOrderWidget() {
  return Container(
      margin: EdgeInsets.all(10),
      child: StreamBuilder<List<Order>>(
          stream: blocInitial.allOrder,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              default:
                return Card(
                    child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: Text(
                          "Últimos pedidos",
                          style: AppTheme.bigSize(),
                        )),
                        InkWell(
                          child: Text(
                            "Ver todos",
                            style: AppTheme.normalSize(),
                          ),
                          onTap: () {
                            blocHome.setPageActual(ConstantsRoutes.ORDER);
                          },
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    lineViewWidget(),
                    Column(children: generateOrderView(context, snapshot.data))
                  ],
                ));
            }
          }));
}

List<Widget> generateOrderView(BuildContext context, List<Order> snapshot) {
  List<Widget> newList = snapshot.map((Order _orders) {
    return InkWell(
      onTap: () {
        pushToDetailOrder(context, _orders);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: Text("N°${_orders.numPedido}"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, right: 10),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 12.0,
                      height: 12.0,
                      margin: EdgeInsets.only(right: 10),
                      decoration: new BoxDecoration(
                        color: _orders.status == OrderStatus.APROVADO
                            ? Colors.green
                            : _orders.status == OrderStatus.PENDENTE
                                ? Colors.yellow
                                : _orders.status == OrderStatus.ENTREGUE
                                    ? Colors.grey
                                    : Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text(
                        "${_orders.status == OrderStatus.APROVADO ? "Aprovado" : _orders.status == OrderStatus.PENDENTE ? "Pendente" : _orders.status == OrderStatus.ENTREGUE ? "Entregue" : "Em transporte"}")
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                  child: Text("Total: R\$${_orders.total.toStringAsFixed(2)}"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, right: 10, bottom: 10),
                child: Text("Data: ${_orders.data}"),
              ),
            ],
          ),
          lineViewWidget()
        ],
      ),
    );
  }).toList();

  return newList;
}

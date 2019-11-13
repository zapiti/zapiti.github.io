
import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/home/home_bloc.dart';
import 'package:portal_grancoffee/bloc/initapp/initial_bloc.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';
import 'package:portal_grancoffee/component/line_view_widget.dart';
import 'package:portal_grancoffee/screens/order_service/widgets/mobile/widget/order_service_mobile_item_list.dart';
import 'package:portal_grancoffee/utils/constants_routes.dart';
import 'package:portal_grancoffee/models/order_service/order_service.dart';

Widget initialMobileOrderServiceWidget() {
  return Container(
    margin: EdgeInsets.all(10),
    child: StreamBuilder<List<OrderService>>(
        stream: blocInitial.allOrderService,
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
                        "Últimos chamados",
                        style: AppTheme.bigSize(),
                      )),
                      InkWell(
                        child: Text(
                          "Ver todos",
                          style: AppTheme.normalSize(),
                        ),
                        onTap: () {
                          blocHome.setPageActual(ConstantsRoutes.ORDER_SERVICE);
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
                  Column(children: generateOrderServiceView(context,snapshot.data))
                ],
              ));
          }
        }),
  );
}

List<Widget> generateOrderServiceView(BuildContext context,List<OrderService> snapshot) {
  List<Widget> newList = snapshot.map((OrderService _orderServices) {
    return InkWell(
      onTap: () {
        pushToDetailOrderService(context,_orderServices);
      }
      ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: Text("#${_orderServices.os}"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, right: 10),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 12.0,
                      height: 12.0,
                      margin: EdgeInsets.only(right: 5),
                      decoration: new BoxDecoration(
                        color: _orderServices.status ==
                                OrderServiceStatus.CONCLUIDO
                            ? Colors.green
                            : Colors.yellow,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text(
                        "${_orderServices.status == OrderServiceStatus.CONCLUIDO ? "Concluido" : "Pendente"}")
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: Text("${_orderServices.tipo}"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, right: 10),
                child: Text("${_orderServices.data}"),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 10, bottom: 10),
            child: Text("${_orderServices.descricao}"),
          ),
          lineViewWidget()
        ],
      ),
    );
  }).toList();

  return newList;
}

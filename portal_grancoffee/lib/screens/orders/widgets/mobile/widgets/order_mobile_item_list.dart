import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';
import 'package:portal_grancoffee/models/order/order.dart';
import 'package:portal_grancoffee/screens/orders/widgets/mobile/order_details/order_details_mobile_page.dart';


class OrderMobileItemList extends StatelessWidget {
  final Order _order;

  OrderMobileItemList(this._order);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 5, left: 5, top: 5),
        color: Colors.white,
        child: Card(
            child: InkWell(
          onTap: () {
            pushToDetailOrder(context,_order);
          },
          child: Center(
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 10,
                  color: _order.status == OrderStatus.APROVADO
                      ? Colors.green
                      : _order.status == OrderStatus.PENDENTE
                      ? Colors.yellow
                      :_order.status == OrderStatus.ENTREGUE
                      ? Colors.grey
                      : Colors.blue,
                ),
                Expanded(
                    child: Column(
                  children: [
                    Row(children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 5, left: 10, bottom: 5),
                          child: Text(
                            "N°${_order.numPedido}",
                            style: AppTheme.normalBoldSize(),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10, top: 5, bottom: 5),
                        child: Text("Status:", style: AppTheme.normalSize()),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10, top: 5, bottom: 5),
                        child: Text(
                            "${_order.status == OrderStatus.APROVADO ? "Aprovado" : _order.status == OrderStatus.PENDENTE ? "Pendente" : _order.status == OrderStatus.ENTREGUE ? "Entregue" : "Em transporte"}",
                            style: AppTheme.normalBoldSize()),
                      )
                    ]),
                    Row(children: [
                      Expanded(
                        child: Container(
                          height: 20,
                          margin: EdgeInsets.only(top: 5, left: 10, bottom: 5),
                          child: Text(
                            "Lançamento: ${_order.data}",
                            style: AppTheme.normalSize(),
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                        margin: EdgeInsets.only(right: 10, top: 5, bottom: 5),
                        child: Text("Previsão: ${_order.previsao}",
                            style: AppTheme.normalSize()),
                      )
                    ]),

                    Row(children: [
                      Expanded(
                        child: Container(
                          height: 20,
                          margin: EdgeInsets.only(top: 5, left: 10, bottom: 10),
                          child: Text(
                            "itens: ${_order.itens}",
                            style: AppTheme.normalSize(),
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                        margin: EdgeInsets.only(right: 10, top: 5, bottom: 10),
                        child: Text("R\$ ${_order.total.toStringAsFixed(2)}",
                            style: AppTheme.normalBoldSize()),
                      )
                    ])
                  ],
                )),
              ],
            ),
          ),
        )));
  }
}

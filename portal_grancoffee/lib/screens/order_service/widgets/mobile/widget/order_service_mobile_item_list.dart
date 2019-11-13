import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';
import 'package:portal_grancoffee/models/order_service/order_service.dart';
import 'package:portal_grancoffee/screens/order_service/widgets/mobile/order_service_details/order_service_details_mobile_page.dart';

class OrderServiceMobileItemList extends StatelessWidget {
  final OrderService _orderService;

  OrderServiceMobileItemList(this._orderService);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 5, left: 5, top: 5),
        child: Card(
            child: InkWell(
          onTap: () {
            pushToDetailOrderService(context,_orderService);
          },
          child: Center(
            child: Row(
              children: [
                Container(
                  height: 160,
                  width: 10,
                  color: _orderService.status == OrderServiceStatus.CONCLUIDO
                      ? Colors.green
                      : _orderService.status == OrderServiceStatus.PENDENTE
                          ? Colors.yellow
                          : AppTheme.colorPrimary,
                ),
                Expanded(
                    child: Column(
                  children: [
                    Row(children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 5, left: 10),
                          child: Text(
                            "#${_orderService.os}",
                            style: AppTheme.normalBoldSize(),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10, top: 5),
                        child: Text("Status:", style: AppTheme.normalSize()),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10, top: 5),
                        child: Text(
                            "${_orderService.status == OrderServiceStatus.CONCLUIDO ? "Pendente" : "Concluído"}",
                            style: AppTheme.normalBoldSize()),
                      )
                    ]),
                    Row(children: [
                      Expanded(
                        child: Container(
                          height: 20,
                          margin: EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            "Endereço: ${_orderService.endereco}",
                            overflow: TextOverflow.ellipsis,
                            style: AppTheme.normalSize(),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10, top: 10),
                        child: Text("", style: AppTheme.normalBoldSize()),
                      )
                    ]),
                    Container(
                      child: Divider(),
                      margin: EdgeInsets.only(left: 8),
                    ),
                    Row(children: [
                      Expanded(
                        child: Container(
                          height: 20,
                          margin: EdgeInsets.only(top: 0, left: 10),
                          child: Text(
                            "Descrição: ${_orderService.descricao}",
                            overflow: TextOverflow.ellipsis,
                            style: AppTheme.normalSize(),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10, top: 10),
                        child: Text("", style: AppTheme.normalBoldSize()),
                      )
                    ]),
                    Container(
                      child: Divider(),
                      margin: EdgeInsets.only(left: 8),
                    ),
                    Row(children: [
                      Expanded(
                        child: Container(
                          height: 20,
                          margin: EdgeInsets.only(top: 5, left: 10, bottom: 10),
                          child: Text(
                            "Data: ${_orderService.data}",
                            style: AppTheme.normalSize(),
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                        margin: EdgeInsets.only(right: 10, top: 5, bottom: 10),
                        child: Text("${_orderService.tipo}",
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
 void pushToDetailOrderService(BuildContext context,OrderService orderService) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => OrderServiceDetailsMobilePage(
            orderService: orderService)),
  );
}
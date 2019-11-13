import 'package:flutter/material.dart';
import 'package:portal_grancoffee/models/order/order.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';

import '../order_details/order_details_dialog.dart';



class OrderTableDataSource extends DataTableSource {
  final List<Order> _orders;
  final BuildContext _context;

  OrderTableDataSource(this._orders,this._context);

  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('#${_orders[index].numPedido}')),
        DataCell(Text('${_orders[index].data}')),
        DataCell(Text('R\$ ${(_orders[index].total).toStringAsFixed(2)}')),
        DataCell(Text('${_orders[index].previsao}')),
        DataCell(Row(
          children: <Widget>[
            Container(
              width: 12.0,
              height: 12.0,
              margin: EdgeInsets.only(right: 10),
              decoration: new BoxDecoration(
                color: _orders[index].status == OrderStatus.APROVADO
                    ? Colors.green
                    : _orders[index].status == OrderStatus.PENDENTE
                        ? Colors.yellow
                        : _orders[index].status == OrderStatus.ENTREGUE
                            ? Colors.grey
                            : Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
            Text(
                "${_orders[index].status == OrderStatus.APROVADO ? "Aprovado" : _orders[index].status == OrderStatus.PENDENTE ? "Pendente" : _orders[index].status == OrderStatus.ENTREGUE ? "Entregue" : "Em transporte"}")
          ],
        )),
        DataCell(
          Container(
              height: 25,
              width: 60,
              child: FlatButton(
                color: AppTheme.colorPrimary,
                  child: Text("Ver",style: AppTheme.smallSize(color: AppTheme.whiteColor),),
                  onPressed: () {
                    showOrderDetailsDialog(_context);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      side: BorderSide(color: AppTheme.colorPrimary)))),
        ),
      ],
    );
  }

  @override
  int get rowCount =>
      _orders?.length ?? 0; // Manipulate this to which ever value you wish

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}

import 'package:flutter/material.dart';
import 'package:portal_grancoffee/models/order_service/order_service.dart';
import 'package:portal_grancoffee/screens/order_service/widgets/web/order_service_details/order_service_details_dialog.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';


class OrderServiceTableDataSource extends DataTableSource {
  final List<OrderService> _orderServices;
  final BuildContext context;

  OrderServiceTableDataSource(this._orderServices, this.context);

  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('#${_orderServices[index].os}')),
        DataCell(Text('${_orderServices[index].data}')),
        DataCell(Text('${_orderServices[index].tipo}')),
        DataCell(Text('${_orderServices[index].endereco}')),
        DataCell(Text('${_orderServices[index].descricao}')),
        DataCell(Row(
          children: <Widget>[
            Container(
              width: 12.0,
              height: 12.0,
              margin: EdgeInsets.only(right: 10),
              decoration: new BoxDecoration(
                color:
                    _orderServices[index].status == OrderServiceStatus.CONCLUIDO
                        ? Colors.green
                        : Colors.yellow,
                shape: BoxShape.circle,
              ),
            ),
            Text(
                "${_orderServices[index].status == OrderServiceStatus.CONCLUIDO ? "Concluido" : "Pendente"}")
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
                    showDetailsOrderServiceDialog(context);
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
      _orderServices?.length ??
      0; // Manipulate this to which ever value you wish

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}


import 'package:flutter/material.dart';
import 'package:portal_grancoffee/models/order_service/order_service.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';

List<DataRow> generateOrderServiceDataRows(List<OrderService> snapshot) {
  List<DataRow> newList = snapshot.map((OrderService _orderServices) {
    return DataRow(cells: [
      DataCell(Text('#${_orderServices.os}')),
      DataCell(Text('${_orderServices.data}')),
      DataCell(Text('${_orderServices.tipo}')),
      DataCell(
        Container(
            height: 25,
            width: 60,
            child: FlatButton(
              color: AppTheme.colorPrimary,
                child: Text("Ver",style: AppTheme.smallSize(color: AppTheme.whiteColor),),
                onPressed: () {

                },
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    side: BorderSide(color: AppTheme.colorPrimary)))),
      ),
    ]);
  }).toList();

  return newList;
}

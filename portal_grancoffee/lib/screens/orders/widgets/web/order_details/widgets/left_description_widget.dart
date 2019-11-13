import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/order/order_bloc.dart';
import 'package:portal_grancoffee/component/single_child_scroll_view_with_scrollbar.dart';
import 'package:portal_grancoffee/models/order/order.dart';

Widget leftDescriptionWidget() {
  return Container(
      child: StreamBuilder<List<Order>>(
          stream: blocOrder.orderData,
          builder: (BuildContext context, AsyncSnapshot<List<Order>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return Container(
                  width: 485,
                  height: 320,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                    strokeWidth: 5,
                  ),
                );
              default:
                if (snapshot.hasError)
                  return Container();
                else
                  return SingleChildScrollViewWithScrollbar(
                      scrollbarColor: Colors.grey[300],

                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columnSpacing: 20,
                            dataRowHeight: 40,

                            columns: <DataColumn>[
                              DataColumn(label: Text('Nome')),
                              DataColumn(label: Text('Unidade')),
                              DataColumn(label: Text('Qtd')),
                              DataColumn(label: Text('Valor unitário')),
                              DataColumn(label: Text('Valor total')),
                            ],
                            rows: generateOrderDetailsDataRows(snapshot.data),
                            //Set Value for rowsPerPage based on comparing the actual data length with the PaginatedDataTable.defaultRowsPerPage
                          )));
            }
          }));
}
List<DataRow> generateOrderDetailsDataRows(List<Order> snapshot) {
  List<DataRow> newList = snapshot.map((Order _orders) {
    return DataRow(cells: [
      DataCell(Text('Nome do produto numero ')),
      DataCell(Text('Cx')),
      DataCell(Text('3')),
      DataCell(Text('R\$ 150,00')),
      DataCell(Text('R\$ 450,00')),
    ]);
  }).toList();

  return newList;
}

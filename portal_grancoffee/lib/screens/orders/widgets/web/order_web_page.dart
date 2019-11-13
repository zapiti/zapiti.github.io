import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/order/order_bloc.dart';
import 'package:portal_grancoffee/models/order/order.dart';
import 'package:portal_grancoffee/screens/orders/widgets/web/widgets/order_header_view.dart';
import 'package:portal_grancoffee/screens/orders/widgets/web/widgets/order_table_data_souce.dart';
import 'package:portal_grancoffee/utils/column_spacing.dart';

class OrderWebPage extends StatefulWidget {
  @override
  _OrderWebPageState createState() => _OrderWebPageState();
}

class _OrderWebPageState extends State<OrderWebPage> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.only(
              top: 20,
            ),
            child: StreamBuilder<List<Order>>(
                stream: blocOrder.orderData,
                builder: (BuildContext context,
                    AsyncSnapshot<List<Order>> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return Container(
                        width: 200,
                        height: 200,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.grey),
                          strokeWidth: 5,
                        ),
                      );
                    default:
                      if (snapshot.hasError)
                        return Container();
                      else
                        return PaginatedDataTable(
                          columnSpacing: columnSpacingDefault(context),
                          dataRowHeight: 40,

                          header: orderHeaderView(context),
                          // comparing the actual data length with the PaginatedDataTable.defaultRowsPerPage and then assigning it to _rowPerPage1 variable which then set using the setsState()
                          onRowsPerPageChanged: false // The source of problem!
                              ? null
                              : (rowCount) {
                                  setState(() {
                                    _rowsPerPage = rowCount;
                                  });
                                },
                          columns: <DataColumn>[
                            DataColumn(label: Text('N°Pedido')),
                            DataColumn(label: Text('Data')),
                            DataColumn(label: Text('Total pedido')),
                            DataColumn(label: Text('Previsão entrega')),
                            DataColumn(label: Text('Status')),
                            DataColumn(label: Text('Ações')),
                          ],
                          source: OrderTableDataSource(snapshot.data, context),
                          //Set Value for rowsPerPage based on comparing the actual data length with the PaginatedDataTable.defaultRowsPerPage
                          rowsPerPage: _rowsPerPage,
                        );
                  }
                })));
  }
}


import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/order_service/order_service_bloc.dart';
import 'package:portal_grancoffee/models/order_service/order_service.dart';
import 'package:portal_grancoffee/screens/order_service/widgets/web/widgets/order_service_header_view.dart';
import 'package:portal_grancoffee/screens/order_service/widgets/web/widgets/order_service_table_data_source.dart';




class OrderServiceWebPage extends StatefulWidget {


  @override
  _OrderServiceWebPageState createState() => _OrderServiceWebPageState();
}

class _OrderServiceWebPageState extends State<OrderServiceWebPage> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            width: MediaQuery.of(context).size.width / 1.2,
            margin: EdgeInsets.only(top: 20),
            child: StreamBuilder<List<OrderService>>(
                stream: blocOrderService.orderData,
                builder: (BuildContext context,
                    AsyncSnapshot<List<OrderService>> snapshot) {
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
                      else {
                        return PaginatedDataTable(
                            columnSpacing: 80,
                            dataRowHeight: 40,
                            header: orderServiceHeaderView(context),
                            // comparing the actual data length with the PaginatedDataTable.defaultRowsPerPage and then assigning it to _rowPerPage1 variable which then set using the setsState()
                            onRowsPerPageChanged:
                            false // The source of problem!
                                ? null
                                : (rowCount) {
                              setState(() {
                                _rowsPerPage = rowCount;
                              });
                            },
                            columns: <DataColumn>[
                              DataColumn(label: Text('OS')),
                              DataColumn(label: Text('Data')),
                              DataColumn(label: Text('Tipo')),
                              DataColumn(label: Text('End.Planta')),
                              DataColumn(label: Text('Descrição')),
                              DataColumn(label: Text('Status')),
                              DataColumn(label: Text('Ações')),
                            ],
                            source: OrderServiceTableDataSource(snapshot.data,context),
                            //Set Value for rowsPerPage based on comparing the actual data length with the PaginatedDataTable.defaultRowsPerPage
                            rowsPerPage: _rowsPerPage);
                      }
                  }
                })));
  }
}

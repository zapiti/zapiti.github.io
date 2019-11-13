import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/home/home_bloc.dart';
import 'package:portal_grancoffee/bloc/initapp/initial_bloc.dart';
import 'package:portal_grancoffee/utils/constants_routes.dart';
import 'package:portal_grancoffee/models/order/order.dart';
import 'package:portal_grancoffee/utils/column_spacing.dart';

import 'generate_order_data_rows.dart';

class OrderInitialFooter extends StatefulWidget {
  @override
  _OrderInitialFooterState createState() => _OrderInitialFooterState();
}

class _OrderInitialFooterState extends State<OrderInitialFooter> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            "Últimos chamados",
            style: TextStyle(fontSize: 22),
          ),
          margin: EdgeInsets.only(top: 20, left: 20),
        ),
        Container(
            child: StreamBuilder<List<Order>>(
                stream: blocInitial.allOrder,
                builder: (BuildContext context,
                    AsyncSnapshot<List<Order>> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return Container(
                        width: 485,
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
                        return SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                  columnSpacing: columnSpacingBottomInitial(context),
                                  dataRowHeight: 40,

                                  columns: <DataColumn>[
                                    DataColumn(label: Text('ID')),
                                    DataColumn(label: Text('Data')),
                                    DataColumn(label: Text('Status')),
                                    DataColumn(label: Text('Ações')),
                                  ],
                                  rows: generateOrderDataRows(snapshot.data),
                                  //Set Value for rowsPerPage based on comparing the actual data length with the PaginatedDataTable.defaultRowsPerPage
                                )));
                  }
                })),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          child: InkWell(
            onTap: () {
              blocHome.setPageActual(ConstantsRoutes.ORDER);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.add,
                  size: 15,
                ),
                Text("Abrir Meus pedidos")
              ],
            ),
          ),
        ),
      ],
    ));
  }
}


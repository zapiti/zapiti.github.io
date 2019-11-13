import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/home/home_bloc.dart';
import 'package:portal_grancoffee/bloc/initapp/initial_bloc.dart';
import 'package:portal_grancoffee/utils/constants_routes.dart';
import 'package:portal_grancoffee/models/order_service/order_service.dart';
import 'package:portal_grancoffee/screens/initapp/widgets/footer/order/order_initial_footer.dart';
import 'package:portal_grancoffee/screens/initapp/widgets/footer/order_service/generate_order_service_rows.dart';
import 'package:portal_grancoffee/utils/column_spacing.dart';

class OrderServiceInitialFooter extends StatefulWidget {
  @override
  _OrderServiceInitialFooterState createState() =>
      _OrderServiceInitialFooterState();
}

class _OrderServiceInitialFooterState extends State<OrderServiceInitialFooter> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            "Últimos pedidos",
            style: TextStyle(fontSize: 22),
          ),
          margin: EdgeInsets.only(top: 20, left: 20),
        ),
        Container(
            child: StreamBuilder<List<OrderService>>(
                stream: blocInitial.allOrderService,
                builder: (BuildContext context,
                    AsyncSnapshot<List<OrderService>> snapshot) {
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
                                  columnSpacing:
                                      columnSpacingBottomInitial(context) - 10,
                                  dataRowHeight: 40,

                                  columns: <DataColumn>[
                                    DataColumn(label: Text('OS')),
                                    DataColumn(label: Text('Data')),
                                    DataColumn(label: Text('Motivo')),
                                    DataColumn(label: Text('Ações')),
                                  ],
                                  rows: generateOrderServiceDataRows(
                                      snapshot.data),
                                  //Set Value for rowsPerPage based on comparing the actual data length with the PaginatedDataTable.defaultRowsPerPage
                                )));
                  }
                })),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          child: InkWell(
            onTap: () {
              blocHome.setPageActual(ConstantsRoutes.ORDER_SERVICE);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.add,
                  size: 15,
                ),
                Text("Abrir Ordem de Serviços")
              ],
            ),
          ),
        )
      ],
    ));
  }
}

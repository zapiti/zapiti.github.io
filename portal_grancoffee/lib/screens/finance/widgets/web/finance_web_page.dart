
import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/finance/finance_bloc.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';
import 'package:portal_grancoffee/models/finance/finance.dart';
import 'package:portal_grancoffee/screens/finance/widgets/web/widgets/finance_table_data_source.dart';
import 'package:portal_grancoffee/utils/column_spacing.dart';
import 'widgets/finance_header_view.dart';

class FinanceWebPage extends StatefulWidget {
  @override
  _FinanceWebPageState createState() => _FinanceWebPageState();
}

class _FinanceWebPageState extends State<FinanceWebPage> {
  int _rowsPerPage1 = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 20),
                child: StreamBuilder<List<Finance>>(
                    stream: blocFinance.financeData,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Finance>> snapshot) {
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
                                header: financeHeaderView(context),
                                // comparing the actual data length with the PaginatedDataTable.defaultRowsPerPage and then assigning it to _rowPerPage1 variable which then set using the setsState()
                                onRowsPerPageChanged:
                                false // The source of problem!
                                    ? null
                                    : (rowCount) {
                                  setState(() {
                                    _rowsPerPage1 = rowCount;
                                  });
                                },
                                columns: <DataColumn>[
                                  DataColumn(label: Text('Fatura')),
                                  DataColumn(label: Text('Data de vencimento')),
                                  DataColumn(label: Text('Valor')),
                                  DataColumn(label: Text('Natureza')),
                                  DataColumn(label: Text('Status')),
                                  DataColumn(label: Text('Ações')),
                                ],
                                source: FinanceTableDataSource(snapshot.data),
                                //Set Value for rowsPerPage based on comparing the actual data length with the PaginatedDataTable.defaultRowsPerPage
                                rowsPerPage: _rowsPerPage1);
                      }
                    })),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Icon(Icons.local_post_office), Text("Duvidas?",style: AppTheme.bigSize(),)],
            ),
            SizedBox(
              height: 8,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text("Envie um e-mail para ",
                  style: AppTheme.normalSize(color: Colors.grey[400])),
              InkWell(
                child: Text("financeiro@grancoffe.com.br",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: Colors.blue[400],
                        decoration: TextDecoration.none)),
                onTap: () {},
              ),
            ]),
            SizedBox(
              height: 15,
            )
          ],
        ));
  }
}


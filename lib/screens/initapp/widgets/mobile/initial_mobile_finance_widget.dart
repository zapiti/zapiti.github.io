import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/home/home_bloc.dart';
import 'package:portal_grancoffee/bloc/initapp/initial_bloc.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';
import 'package:portal_grancoffee/component/line_view_widget.dart';
import 'package:portal_grancoffee/models/finance/finance.dart';
import 'package:portal_grancoffee/utils/constants_routes.dart';

Widget initialMobileFinanceWidget() {
  return Container(
      margin: EdgeInsets.only(right: 10,left: 10,bottom: 10),
      child: StreamBuilder<List<Finance>>(
          stream: blocInitial.allFinance,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              default:
                return Card(
                    child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: Text(
                          "Titulos em atraso",
                          style: AppTheme.bigSize(),
                        )),
                        InkWell(
                          child: Text(
                            "Ver todos",
                            style: AppTheme.normalSize(),
                          ),
                          onTap: () {
                            blocHome.setPageActual(ConstantsRoutes.FINANCE);
                          },
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    lineViewWidget(),
                    Column(children: generateFinanceView(snapshot.data))
                  ],
                ));
            }
          }));
}

List<Widget> generateFinanceView(List<Finance> snapshot) {
  List<Widget> newList = snapshot.map((Finance _finance) {
    return InkWell(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: Text("Fatura: ${_finance.fatura}"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, right: 10),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 12.0,
                      height: 12.0,
                      margin: EdgeInsets.only(right: 10),
                      decoration: new BoxDecoration(
                        color: _finance.status == FinanceStatus.PAGO
                            ? Colors.green
                            : _finance.status == FinanceStatus.EM_ABERTO
                            ? Colors.yellow
                            : AppTheme.colorPrimary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text(
                        "${_finance.status == FinanceStatus.PAGO ? "Pago" : _finance.status == FinanceStatus.EM_ABERTO ? "Em andamento" : "Vencido"}")
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: Text("Total: R\$${_finance.valores.toStringAsFixed(2)}"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, right: 10),
                child: Text("Data Venc: ${_finance.dataVenc}"),
              ),
            ],
          ),  Container(
            margin: EdgeInsets.only(top: 10, left: 10, bottom: 10),
            child: Text("Natureza : ${_finance.natureza}"),
          ),
          lineViewWidget()
        ],
      ),
    );
  }).toList();

  return newList;
}

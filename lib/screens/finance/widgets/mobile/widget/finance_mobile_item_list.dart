
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';
import 'package:portal_grancoffee/component/line_view_widget.dart';
import 'package:portal_grancoffee/models/finance/finance.dart';
class FinanceMobileItemList extends StatelessWidget {
  final Finance _finance;
  FinanceMobileItemList(this._finance);
  @override
  Widget build(BuildContext context) {


    return Container(

        margin: EdgeInsets.only(right: 5,left: 5,top: 5),
        color: Colors.white,
        child:  Card(child:

        Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          child: Center(
            child:  Row(
                    children: [
                      Container(
                        height: 90,
                        width: 10,
                        color:  _finance.status == FinanceStatus.PAGO
                            ? Colors.green
                            : _finance.status == FinanceStatus.EM_ABERTO
                            ? Colors.yellow
                            : AppTheme.colorPrimary,
                      ),
                      Expanded(
                          child: Column(
                            children: [
                              Row(children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 0, left: 10),
                                    child: Text(
                                      "#${_finance.fatura}",
                                      style: AppTheme.normalBoldSize(),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10, top: 0),
                                  child: Text( "Status:"  , style: AppTheme.normalSize()),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10, top: 0),
                                  child: Text(  "${_finance.status == FinanceStatus.PAGO ? "Pago" : _finance.status == FinanceStatus.EM_ABERTO ? "Em andamento" : "Vencido"}",
                                      style: AppTheme.normalBoldSize()),
                                )
                              ]),
                             Row(children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10, left: 10),
                                    child: Text(
                                      "Natureza: ${_finance.natureza}",
                                      style: AppTheme.normalSize(),
                                    ),
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(right: 10, top: 10),
                                  child: Text( "",
                                      style: AppTheme.normalBoldSize()),
                                )
                              ])

                              ,
                              Row(children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10, left: 10),
                                    child: Text(
                                      "Vencimento: ${_finance.dataVenc}",
                                      style: AppTheme.normalSize(),
                                    ),
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(right: 10, top: 10),
                                  child: Text( "R\$ ${_finance.valores.toStringAsFixed(2)}",
                                      style: AppTheme.normalBoldSize()),
                                )
                              ])
                            ],
                          )),

                    ],
                  ),

          )

          ,secondaryActions: <Widget>[
          IconSlideAction(
            caption: '2° via boleto',
            color: Colors.black45,
            icon: Icons.format_list_bulleted,
            onTap: () => {},
          ),
          IconSlideAction(
            caption: 'Nota fiscal',
            color: AppTheme.colorPrimary,
            icon: Icons.content_paste,
            onTap: () => {},
          ), IconSlideAction(
            caption: 'Relatório',
            color: Colors.blue,
            icon: Icons.table_chart,
            onTap: () => {},
          ),
          IconSlideAction(
            caption: 'Enviar comprovante',
            color: Colors.indigo,
            icon: Icons.share,
            onTap: () => {},
          ),
        ],
    )   ));
  }
}

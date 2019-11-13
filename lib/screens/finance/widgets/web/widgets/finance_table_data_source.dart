import 'package:flutter/material.dart';
import 'package:portal_grancoffee/models/finance/finance.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';


class FinanceTableDataSource extends DataTableSource {
  final List<Finance> _finances;

  FinanceTableDataSource(this._finances);

  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('#${_finances[index].fatura}')),
        DataCell(Text('${_finances[index].dataVenc}')),
        DataCell(Text('R\$ ${_finances[index].valores.toStringAsFixed(2)}')),
        DataCell(Text('${_finances[index].natureza}')),
        DataCell(Row(
          children: <Widget>[
            Container(
              width: 12.0,
              height: 12.0,
              margin: EdgeInsets.only(right: 10),
              decoration: new BoxDecoration(
                color: _finances[index].status == FinanceStatus.PAGO
                    ? Colors.green
                    : _finances[index].status == FinanceStatus.EM_ABERTO
                        ? Colors.yellow
                        : AppTheme.colorPrimary,
                shape: BoxShape.circle,
              ),
            ),
            Text(
                "${_finances[index].status == FinanceStatus.PAGO ? "Pago" : _finances[index].status == FinanceStatus.EM_ABERTO ? "Em andamento" : "Vencido"}")
          ],
        )),
        DataCell(Row(children: <Widget>[
          InkWell(
            child: Icon(Icons.reorder),
            onTap: () {

            },
          ),
          SizedBox(
            width: 5,
          ),
          InkWell(
            child: Icon(Icons.chrome_reader_mode),
            onTap: () {

            },
          ),
          SizedBox(
            width: 5,
          ),
          InkWell(
            child: Icon(Icons.table_chart),
            onTap: () {

            },
          ),
          SizedBox(
            width: 5,
          ),
          InkWell(
            child: Icon(Icons.email),
            onTap: () {

            },
          )
        ])),
      ],
    );
  }

  @override
  int get rowCount =>
      _finances?.length ?? 0; // Manipulate this to which ever value you wish

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}

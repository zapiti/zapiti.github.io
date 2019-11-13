import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/finance/finance_bloc.dart';
import 'package:portal_grancoffee/models/finance/filter_finance.dart';

Widget financeHeaderView(BuildContext context) {
  return MediaQuery.of(context).size.width > 800
      ? Row(
          children: <Widget>[
            Expanded(
              child: Text("Financeiro"),
            ),
            Container(
                width: 300,
                child: TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: "Busca",
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.fromLTRB(0.0, 18.0, 0.0, 0.0)),
                )),
            Container(
              margin: EdgeInsets.only(top: 20, right: 20, left: 20),
              child: StreamBuilder<FiterFinance>(
                  stream: blocFinance.allContract,
                  builder: (BuildContext context,
                      AsyncSnapshot<FiterFinance> snapshot) {
                    return DropdownButton<String>(
                      items: (snapshot.data?.listContact ?? [])
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: snapshot.data?.selectedContact ?? "Selecione um contato",
                      onChanged: (String val) {
                        if (val != "Selecione um contato") {
                          blocFinance.setContactSelected(val);
                        } else {
                          blocFinance.setContactSelected(null);
                        }
                      },
                    );
                  }),
            ),
          ],
        )
      : Row(
          children: <Widget>[
            Expanded(
              child: Text("Financeiro"),
            ),
            Container(
                width: 200,
                child: TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: "Busca",
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.fromLTRB(0.0, 18.0, 0.0, 0.0)),
                )),
          ],
        );
}

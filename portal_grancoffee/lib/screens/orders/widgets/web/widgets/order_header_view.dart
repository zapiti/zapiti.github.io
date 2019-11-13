import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/order/order_bloc.dart';
import 'package:portal_grancoffee/models/order/filter_order.dart';

Widget orderHeaderView(BuildContext context) {
  return MediaQuery.of(context).size.width > 800
      ? Row(
          children: <Widget>[
            Expanded(
              child: Text("Meus pedidos"),
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
              child: StreamBuilder<FilterOrder>(
                  stream: blocOrder.allContract,
                  builder: (BuildContext context,
                      AsyncSnapshot<FilterOrder> snapshot) {
                    return DropdownButton<String>(
                      items: (snapshot.data?.listContact ?? [])
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: snapshot.data?.selectedContact ??
                          "Selecione um contato",
                      onChanged: (String val) {
                        if (val != "Selecione um contato") {
                          blocOrder.setContactSelected(val);
                        } else {
                          blocOrder.setContactSelected(null);
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
              child: Text("Meus pedidos"),
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

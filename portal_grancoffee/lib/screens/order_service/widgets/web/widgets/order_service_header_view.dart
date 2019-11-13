import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/order_service/order_service_bloc.dart';
import 'package:portal_grancoffee/models/order_service/filter_order_service.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';

import '../new_order_service/new_order_service_dialog.dart';

Widget orderServiceHeaderView(BuildContext context) {
  return MediaQuery.of(context).size.width > 800
      ? Row(
          children: <Widget>[
            Expanded(
              child: Text("Ordem de servico"),
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
                height: 30,
                width: 100,
                margin: EdgeInsets.only(top: 20, left: 15),
                child: FlatButton(

                  color: AppTheme.colorPrimary,
                    child: Text("Abrir OS",style: AppTheme.smallSize(color: AppTheme.whiteColor)),
                    onPressed: () {
                      showNewOrderServiceDialog(context);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        side: BorderSide(color: AppTheme.colorPrimary)))),
            Container(
              margin: EdgeInsets.only(top: 20, right: 20, left: 20),
              child: StreamBuilder<FilterOrderService>(
                  stream: blocOrderService.allContract,
                  builder: (BuildContext context,
                      AsyncSnapshot<FilterOrderService> snapshot) {
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
                          blocOrderService.setContactSelected(val);
                        } else {
                          blocOrderService.setContactSelected(null);
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
              child: Text("Ordem de servico"),
            ),
            Container(
                height: 30,
                width: 100,
                margin: EdgeInsets.only(top: 20, left: 15),
                child: FlatButton(
                  color: AppTheme.colorPrimary,
                    child: Text("Abrir OS",style: AppTheme.smallSize(color: AppTheme.whiteColor)),
                    onPressed: () {
                      showNewOrderServiceDialog(context);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        side: BorderSide(color: AppTheme.colorPrimary)))),
          ],
        );
}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/order/order_bloc.dart';
import 'package:portal_grancoffee/bloc/order_service/order_service_bloc.dart';
import 'package:portal_grancoffee/models/order/order.dart';
import 'package:portal_grancoffee/models/order_service/order_service.dart';
import 'package:portal_grancoffee/screens/order_service/widgets/mobile/widget/order_service_mobile_item_list.dart';
import 'package:portal_grancoffee/screens/orders/widgets/mobile/widgets/order_mobile_item_list.dart';

class OrderMobilePage extends StatefulWidget {
  @override
  _OrderMobilePageState createState() => _OrderMobilePageState();
}

class _OrderMobilePageState extends State<OrderMobilePage> {
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<List<Order>>(
        stream: blocOrder.orderData,
        builder: (BuildContext context,
            AsyncSnapshot<List<Order>> snapshot) {
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
                return ListView.builder(
                    padding: EdgeInsets.all(0.0),
                    reverse: false,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return OrderMobileItemList(snapshot.data[index]);
                    });

          }});
  }
}

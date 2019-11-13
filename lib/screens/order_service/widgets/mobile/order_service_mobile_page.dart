import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/order_service/order_service_bloc.dart';
import 'package:portal_grancoffee/models/order_service/order_service.dart';
import 'package:portal_grancoffee/screens/order_service/widgets/mobile/new_order_service/new_order_service_mobile_page.dart';
import 'package:portal_grancoffee/screens/order_service/widgets/mobile/widget/order_service_mobile_item_list.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';

class OrderServiceMobilePage extends StatefulWidget {
  @override
  _OrderServiceMobilePageState createState() => _OrderServiceMobilePageState();
}

class _OrderServiceMobilePageState extends State<OrderServiceMobilePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<OrderService>>(
        stream: blocOrderService.orderData,
        builder:
            (BuildContext context, AsyncSnapshot<List<OrderService>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Container(
                width: 200,
                height: 200,
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                  strokeWidth: 5,
                ),
              );
            default:
              if (snapshot.hasError)
                return Container();
              else
                return Stack(children: [
                  ListView.builder(
                      padding: EdgeInsets.all(0.0),
                      reverse: false,
                      itemCount: snapshot.data.length + 1,
                      itemBuilder: (context, index) {
                        return index < snapshot.data.length
                            ? OrderServiceMobileItemList(snapshot.data[index])
                            : SizedBox(height: 80);
                      }),
                  Positioned(
                    right: 15.0,
                    bottom: 15.0,
                    child: new FloatingActionButton(
                      child: const Icon(Icons.add),
                      backgroundColor: AppTheme.colorPrimary,
                      onPressed: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewOrderServiceMobilePage()),
                        );

                      },
                    ),
                  ),
                ]);
          }
        });
  }
}

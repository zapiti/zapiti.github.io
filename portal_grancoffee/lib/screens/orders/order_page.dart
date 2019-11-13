import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/home/home_bloc.dart';
import 'package:portal_grancoffee/bloc/order/order_bloc.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';
import 'package:portal_grancoffee/models/order/order.dart';
import 'package:portal_grancoffee/screens/orders/widgets/mobile/order_mobile_page.dart';
import 'package:portal_grancoffee/screens/orders/widgets/web/order_web_page.dart';
import 'package:portal_grancoffee/screens/orders/widgets/web/widgets/order_header_view.dart';
import 'package:portal_grancoffee/screens/orders/widgets/web/widgets/order_table_data_souce.dart';
import 'package:portal_grancoffee/utils/column_spacing.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {


  @override
  void initState() {
    // TODO: implement initState

    meuContextoGlobal = context;
    super.initState();
  }

  @override
  void dispose() {
    blocOrder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppTheme.typeTheme(context) == ThemeLayoutType.WEB
        ? OrderWebPage()
        : OrderMobilePage();
  }
}

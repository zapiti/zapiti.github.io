import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/home/home_bloc.dart';
import 'package:portal_grancoffee/bloc/order_service/order_service_bloc.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';
import 'package:portal_grancoffee/screens/order_service/widgets/mobile/order_service_mobile_page.dart';
import 'package:portal_grancoffee/screens/order_service/widgets/web/order_service_web_page.dart';

class OrderServicePage extends StatefulWidget {
  @override
  _OrderServicePageState createState() => _OrderServicePageState();
}

class _OrderServicePageState extends State<OrderServicePage> {
  @override
  void initState() {

    meuContextoGlobal = context;
    super.initState();
  }

  @override
  void dispose() {
    blocOrderService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppTheme.typeTheme(context) == ThemeLayoutType.WEB
          ? OrderServiceWebPage()
          : OrderServiceMobilePage();

  }
}

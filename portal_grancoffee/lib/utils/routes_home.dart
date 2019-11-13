import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal_grancoffee/screens/finance/finance_page.dart';
import 'package:portal_grancoffee/screens/initapp/init_page.dart';
import 'package:portal_grancoffee/screens/order_service/order_service_page.dart';
import 'package:portal_grancoffee/screens/orders/order_page.dart';
import 'package:portal_grancoffee/screens/userdata/user_data_page.dart';
import 'package:portal_grancoffee/utils/constants_routes.dart';

class RoutesHome {
  static String initialRoute = "/";

  static Route<dynamic> onUnknownRoute(
    BuildContext context, {
    @required RouteSettings settings,
  }) {
    final route = settings.name;
    if (route.toLowerCase() == ConstantsRoutes.FINANCE) {
      return MaterialPageRoute(
        builder: (BuildContext context) => FinancePage(),
        settings: settings,
      );
    } else if (route.toLowerCase() == ConstantsRoutes.ORDER_SERVICE) {
      return MaterialPageRoute(
        builder: (BuildContext context) => OrderServicePage(),
        settings: settings,
      );
    } else if (route.toLowerCase() == ConstantsRoutes.ORDER) {
      MaterialPageRoute(
        builder: (BuildContext context) => OrderPage(),
        settings: settings,
      );
    } else if (route.toLowerCase() == ConstantsRoutes.MY_DATA) {
      MaterialPageRoute(
        builder: (BuildContext context) => UserDataPage(),
        settings: settings,
      );
    } else {
      MaterialPageRoute(
        builder: (BuildContext context) => InitPage(),
        settings: settings,
      );
    }
  }

  static Map<String, WidgetBuilder> routes(BuildContext context) {
    return{
      ConstantsRoutes.FINANCE: (BuildContext context) => FinancePage(),
      ConstantsRoutes.ORDER_SERVICE: (BuildContext context) => OrderServicePage(),
      ConstantsRoutes.ORDER: (BuildContext context) => OrderPage(),
      ConstantsRoutes.MY_DATA: (BuildContext context) => UserDataPage(),
      ConstantsRoutes.HOME: (BuildContext context) => InitPage(),
    };
  }
}

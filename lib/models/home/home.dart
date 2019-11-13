//enum ConstantsRoutes { HOME, FINANCE, ORDER_SERVICE, ORDER, MY_DATA }

import 'package:portal_grancoffee/utils/constants_routes.dart';

class Home {
  final String name;
  final String url;
  final List<String> employers;
  String selectedEmployer;
  String searchString;
  String selectedHome = ConstantsRoutes.HOME;

  Home({this.name, this.url, this.employers, this.selectedEmployer});
}

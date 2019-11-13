import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:portal_grancoffee/bloc/finance/finance_bloc.dart';
import 'package:portal_grancoffee/bloc/home/home_bloc.dart';
import 'package:portal_grancoffee/bloc/initapp/initial_bloc.dart';
import 'package:portal_grancoffee/bloc/navbar/nav_bar_bloc.dart';
import 'package:portal_grancoffee/bloc/order/order_bloc.dart';
import 'package:portal_grancoffee/bloc/order_service/order_service_bloc.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';
import 'package:portal_grancoffee/bloc/userdata/user_data_bloc.dart';
import 'package:portal_grancoffee/models/navbar/navbar.dart';
import 'package:portal_grancoffee/screens/finance/finance_page.dart';
import 'package:portal_grancoffee/screens/home/widgets/list_drawer_itens_widget.dart';
import 'package:portal_grancoffee/screens/home/widgets/title_widget.dart';
import 'package:portal_grancoffee/screens/initapp/init_page.dart';
import 'package:portal_grancoffee/screens/order_service/order_service_page.dart';
import 'package:portal_grancoffee/screens/orders/order_page.dart';
import 'package:portal_grancoffee/screens/userdata/user_data_page.dart';
import 'package:portal_grancoffee/utils/constants_routes.dart';
import 'package:portal_grancoffee/utils/routes_home.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool isSearch = false;

  Widget appBarTitle;

  @override
  void initState() {
    blocHome.getHome();
    blocFinance.getFinance();
    blocUserData.getUserData();
    blocInitial.getBanners();
    blocInitial.getOrders();
    blocInitial.getCallsOS();
    blocInitial.getTitlesFinance();
    blocOrderService.getOrders();
    blocOrder.getOrders();
    appBarTitle = titleWidget();
    blocNavBar.getNav();


    super.initState();
  }

  @override
  void dispose() {
    blocHome.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<NavBar>(
        stream: blocNavBar.navData,
        builder: (BuildContext context, AsyncSnapshot<NavBar> snapshot)
        {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: getAppBar(context,snapshot.data?.showNav ?? false),
              body: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    MediaQuery
                        .of(context)
                        .size
                        .width < 1100
                        ? Container()
                        : Card(
                      child: Container(
                          margin: EdgeInsets.all(0),
                          height: MediaQuery
                              .of(context)
                              .size
                              .height,
                          width: 300,
                          color: Colors.white,
                          child: listDrawerItems(false)),
                    ),
                    Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width < 1100
                            ? MediaQuery
                            .of(context)
                            .size
                            .width
                            : MediaQuery
                            .of(context)
                            .size
                            .width - 310,
                        child: MaterialApp(
                          initialRoute: ConstantsRoutes.HOME,
                          debugShowCheckedModeBanner: false,
                          onUnknownRoute: (settings) =>
                              RoutesHome.onUnknownRoute(
                                context,
                                settings: settings,
                              ),
                          onGenerateRoute: (RouteSettings routeSettings) {
                            return new PageRouteBuilder<dynamic>(
                                settings: routeSettings,
                                pageBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation) {
                                  final route = routeSettings.name;
                                  if (route.toLowerCase() ==
                                      ConstantsRoutes.FINANCE) {
                                    return FinancePage();
                                  } else if (route.toLowerCase() ==
                                      ConstantsRoutes.ORDER_SERVICE) {
                                    return OrderServicePage();
                                  } else if (route.toLowerCase() ==
                                      ConstantsRoutes.ORDER) {
                                    return OrderPage();
                                  } else if (route.toLowerCase() ==
                                      ConstantsRoutes.MY_DATA) {
                                    return UserDataPage();
                                  } else {
                                    return InitPage();
                                  }
                                },
                                transitionDuration: const Duration(
                                    milliseconds: 500),
                                transitionsBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation,
                                    Widget child) {
                                  return effectMap[PageTransitionType.slideDown](
                                      Curves.linear,
                                      animation,
                                      secondaryAnimation,
                                      child);
                                });
                          },
//                routes:
//
//
//
//                RoutesHome.routes(context),
                        ))
                  ]),
              drawer: Drawer(child: listDrawerItems(true)));
        });

  }


  Widget getAppBar(BuildContext context,bool showNave) {
    return
      MediaQuery
          .of(context)
          .size
          .width < 1100
          ? showNave ? AppBar(
          automaticallyImplyLeading:
          MediaQuery
              .of(context)
              .size
              .width < 1100 ? true : false,
          iconTheme: IconThemeData(color: AppTheme.colorPrimary),
          title: AppTheme.typeTheme(context) != ThemeLayoutType.WEB
              ? appBarTitle
              : titleWidget(),
          backgroundColor: Colors.white,
          actions: <Widget>[
            AppTheme.typeTheme(context) != ThemeLayoutType.WEB
                ? IconButton(
              icon: !isSearch
                  ? Icon(Icons.search)
                  : Icon(Icons.close),
              onPressed: () {
                setState(() {
                  isSearch = !isSearch;
                  if (isSearch) {
                    appBarTitle = titleWidget(isSearch: isSearch);
                  } else {
                    appBarTitle = titleWidget();
                  }
                });
              },
            )
                : SizedBox(),
          ]) : null : null;


  }
}

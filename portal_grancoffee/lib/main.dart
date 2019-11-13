import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/home/home_bloc.dart';
import 'package:portal_grancoffee/utils/constants_routes.dart';

import 'package:portal_grancoffee/screens/home/home_screen.dart';
import 'package:portal_grancoffee/screens/login/login.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> routes = {
      '/': (BuildContext context) => LoginScreeam(),
      ConstantsRoutes.HOME: (BuildContext context) => HomeScreen(),
      ConstantsRoutes.FINANCE: (BuildContext context){
        blocHome.setPageActual(ConstantsRoutes.FINANCE,delay: 500,delayInState: true);
       return HomeScreen() ;
      },
      ConstantsRoutes.ORDER_SERVICE: (BuildContext context){
        blocHome.setPageActual(ConstantsRoutes.ORDER_SERVICE,delay: 500,delayInState: true);
        return HomeScreen();
      },
      ConstantsRoutes.ORDER: (BuildContext context){
        blocHome.setPageActual(ConstantsRoutes.ORDER,delay: 500,delayInState: true);
        return HomeScreen() ;
      },
      ConstantsRoutes.MY_DATA: (BuildContext context){
        blocHome.setPageActual(ConstantsRoutes.MY_DATA,delay: 500,delayInState: true);
        return HomeScreen() ;
      },
    };
    return MaterialApp(
      initialRoute: '/',
      routes: routes,
      debugShowCheckedModeBanner: false,
      title: 'Portal Grancoffee',

    );
  }
}


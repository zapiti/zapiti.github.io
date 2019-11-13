import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/home/home_bloc.dart';
import 'package:portal_grancoffee/bloc/initapp/initial_bloc.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';
import 'package:portal_grancoffee/screens/initapp/widgets/body/body_initial_view.dart';
import 'package:portal_grancoffee/screens/initapp/widgets/footer/footer_initial_view.dart';
import 'package:portal_grancoffee/screens/initapp/widgets/header/header_initial_view.dart';
import 'package:portal_grancoffee/screens/initapp/widgets/mobile/initial_mobile_finance_widget.dart';
import 'package:portal_grancoffee/screens/initapp/widgets/mobile/initial_mobile_order_service_widget.dart';
import 'package:portal_grancoffee/screens/initapp/widgets/mobile/initial_mobile_order_widget.dart';

class InitPage extends StatefulWidget {
  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  void initState() {

    meuContextoGlobal = context;
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return AppTheme.typeTheme(context) == ThemeLayoutType.WEB
        ? SingleChildScrollView(

            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              HeaderInitialView(),
              BodyInitialView(),
              BottomInitialView(),
              SizedBox(
                height: 50,
              )
            ],
          ))
        : getContentMobile();
  }
}

Widget getContentMobile() {
  return ListView(
    children: <Widget>[
      initialMobileFinanceWidget(),
      initialMobileOrderWidget(),
      initialMobileOrderServiceWidget()],
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/finance/finance_bloc.dart';
import 'package:portal_grancoffee/bloc/home/home_bloc.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';
import 'package:portal_grancoffee/screens/finance/widgets/mobile/finance_mobile_page.dart';
import 'package:portal_grancoffee/screens/finance/widgets/web/finance_web_page.dart';

class FinancePage extends StatefulWidget {
  @override
  _FinancePageState createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {
  @override
  void initState() {
    // TODO: implement initState

    meuContextoGlobal = context;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    blocFinance.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppTheme.typeTheme(context) == ThemeLayoutType.WEB
        ? FinanceWebPage()
        : FinanceMobilePage();
  }
}

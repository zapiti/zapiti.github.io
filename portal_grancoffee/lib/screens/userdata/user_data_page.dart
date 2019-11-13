import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/home/home_bloc.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';
import 'package:portal_grancoffee/bloc/userdata/user_data_bloc.dart';
import 'package:portal_grancoffee/models/userdata/user_data.dart';
import 'package:portal_grancoffee/screens/userdata/mobile/user_data_mobile_page.dart';
import 'package:portal_grancoffee/screens/userdata/web/user_data_web_page.dart';

class UserDataPage extends StatefulWidget {
  @override
  _UserDataPageState createState() => _UserDataPageState();
}

class _UserDataPageState extends State<UserDataPage> {
  @override
  void initState() {

    meuContextoGlobal = context;
    super.initState();
  }

  @override
  void dispose() {
    blocUserData.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppTheme.typeTheme(context) == ThemeLayoutType.WEB
        ? UserDataWebPage()
        : UserDataMobilePage();
  }
}

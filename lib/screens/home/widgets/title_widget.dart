import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/home/home_bloc.dart';
import 'package:portal_grancoffee/models/home/home.dart';
import 'package:portal_grancoffee/utils/constants_routes.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';

Widget titleWidget({bool isSearch = false, bool drawerTitle = false}) {
  return StreamBuilder<Home>(
      stream: blocHome.homeData,
      builder: (BuildContext context, AsyncSnapshot<Home> snapshot) {
        return !isSearch
            ? Container(
                margin: EdgeInsets.only(left: 0),
                child: !drawerTitle
                    ? Text(
                        snapshot.data?.selectedHome == ConstantsRoutes.MY_DATA
                            ? "Meus dados"
                            : snapshot.data?.selectedHome ==
                                    ConstantsRoutes.HOME
                                ? "Inicio"
                                : snapshot.data?.selectedHome ==
                                        ConstantsRoutes.FINANCE
                                    ? "Financeiro"
                                    : snapshot.data?.selectedHome ==
                                            ConstantsRoutes.ORDER_SERVICE
                                        ? "Ordem de serviço"
                                        : snapshot.data?.selectedHome ==
                                                ConstantsRoutes.ORDER
                                            ? "Pedidos"
                                            : "Grancoffee",
                        style: TextStyle(
                          fontSize: 24,
                          color: AppTheme.colorPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Container(
                        height: 50,
                        width: 500,
                        color: AppTheme.colorPrimary,
                        child: Image.asset(
                          "assets/images/ic_gran_coffee.png",
                          scale: 0.5,
                        ),
                      ),
              )
            : TextField(
                style: TextStyle(
                  color: AppTheme.colorPrimary,
                ),
                decoration: new InputDecoration(
                    prefixIcon:
                        new Icon(Icons.search, color: AppTheme.colorPrimary),
                    hintText: "buscar...",
                    hintStyle: new TextStyle(color: AppTheme.colorPrimary)),
              );
      });
}

import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/navbar/nav_bar_bloc.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';
import 'package:portal_grancoffee/component/horizontal_list_image_widget.dart';
import 'package:portal_grancoffee/component/title_descritption_mobile_widget.dart';
import 'package:portal_grancoffee/models/order_service/order_service.dart';

class OrderServiceDetailsMobilePage extends StatelessWidget {
  final OrderService orderService;

  OrderServiceDetailsMobilePage({this.orderService});

  @override
  Widget build(BuildContext context) {
    blocNavBar.seShowHideNav(false);

    return WillPopScope(
        onWillPop: () async {
          blocNavBar.seShowHideNav(true);
          return true;
        },
        child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: AppTheme.colorPrimary),
              backgroundColor: Colors.white,
              title: Text("Detalhe OS" , style: TextStyle(
                fontSize: 24,
                color: AppTheme.colorPrimary,
                fontWeight: FontWeight.bold,
              ),),
            ),
            body: SingleChildScrollView(
                padding: EdgeInsets.all(0),
                child: Column(children: <Widget>[
                  titleDescriptionMobileWidget(
                    title: "Os",
                    description: "${orderService.os}",
                  ),
                  titleDescriptionMobileWidget(
                      title: "Data", description: "${orderService.data}"),
                  titleDescriptionMobileWidget(
                      title: "Patrimônio", description: "Conteúdo patrimônio"),
                  titleDescriptionMobileWidget(
                      title: "Planta", description: "${orderService.endereco}"),
                  titleDescriptionMobileWidget(
                      title: "Motivo", description: "Falta de abastecimento"),
                  titleDescriptionMobileWidget(
                      title: "E-mail",
                      description: "emaildocliente@empresa1.com.br"),
                  titleDescriptionMobileWidget(
                      title: "Status", description: "Pendente"),
                  titleDescriptionMobileWidget(
                      title: "Problema",
                      description: "${orderService.descricao}"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 20,
                        ),
                        Text("Anexo", style: AppTheme.normalSize()),
                      ]),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    child: Row(
                      children: horizontalListImageWidget(),
                    ),
                    scrollDirection: Axis.horizontal,
                  )     ,SizedBox(
                    height: 40,
                  ),
                ]))));
  }
}

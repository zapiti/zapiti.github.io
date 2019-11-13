import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/finance/finance_bloc.dart';
import 'package:portal_grancoffee/bloc/home/home_bloc.dart';
import 'package:portal_grancoffee/bloc/order/order_bloc.dart';
import 'package:portal_grancoffee/bloc/order_service/order_service_bloc.dart';
import 'package:portal_grancoffee/models/home/home.dart';
import 'package:portal_grancoffee/utils/constants_routes.dart';
import 'package:portal_grancoffee/screens/home/widgets/drawer_button_widget.dart';
import 'package:portal_grancoffee/screens/home/widgets/title_widget.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';


class listDrawerItems extends StatefulWidget {
  bool drawerStatus;

  listDrawerItems(this.drawerStatus);
  @override
  _listDrawerItemsState createState() => _listDrawerItemsState();
}

class _listDrawerItemsState extends State<listDrawerItems> {



  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Home>(
        stream: blocHome.homeData,
        builder: (BuildContext context, AsyncSnapshot<Home> snapshot) {
          return ListView(
            children: <Widget>[
              Container(
                height: 80,
                color: AppTheme.colorPrimary,
                child: Center(
                  child: titleWidget(drawerTitle: true),
                ),
              )
              ,
              Container(
                width: MediaQuery.of(context).size.width,
                height: 0,
                color: AppTheme.whiteColor,
              )
              ,
              Container(
                margin: EdgeInsets.only(left: 8),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: snapshot.data?.url != null
                          ? CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                          NetworkImage(snapshot.data?.url ?? ""))
                          : SizedBox(
                        width: 20,
                      ),
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 20,
                            child: Text(
                              snapshot.data?.name ?? "",
                              style: TextStyle(fontSize: 18),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            height: 30,
                            child: DropdownButton<String>(
                              underline: SizedBox(),
                              items: (snapshot.data?.employers ?? [])
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              value: snapshot.data?.selectedEmployer ?? "",
                              onChanged: (String val) {
                                blocHome.setEmployersActual(val);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 0.4,
                color: Colors.grey[300],
              ),
              DrawerButton(
                  active: snapshot.data?.selectedHome == ConstantsRoutes.HOME,
                  context: context,
                  title: "Inicio",
                  iconData: Icons.dashboard,
                  onPressed: () {
                    clearAllBloc();
                    blocHome.setPageActual(ConstantsRoutes.HOME);
                    widget.drawerStatus ? Navigator.pop(context) : print("");
                  }),
              DrawerButton(
                  active: snapshot.data?.selectedHome == ConstantsRoutes.FINANCE,
                  context: context,
                  title: "Financeiro",
                  iconData: Icons.insert_chart,
                  onPressed: () {
                    clearAllBloc();

                    blocHome.setPageActual(ConstantsRoutes.FINANCE);
                  widget.drawerStatus ? Navigator.pop(context) : print("");
                  }),
              DrawerButton(
                  active:
                  snapshot.data?.selectedHome == ConstantsRoutes.ORDER_SERVICE,
                  context: context,
                  title: "Ordem de Serviço",
                  iconData: Icons.content_paste,
                  onPressed: () {
                    clearAllBloc();
                    blocHome.setPageActual(ConstantsRoutes.ORDER_SERVICE);
                    widget.drawerStatus ? Navigator.pop(context) : print("");
                  }),
              DrawerButton(
                  active: snapshot.data?.selectedHome == ConstantsRoutes.ORDER,
                  context: context,
                  title: "Meus pedidos",
                  iconData: Icons.add_shopping_cart,
                  onPressed: () {
                    clearAllBloc();
                    blocHome.setPageActual(ConstantsRoutes.ORDER);
                    widget.drawerStatus ? Navigator.pop(context) : print("");
                  }),
              DrawerButton(
                  active: snapshot.data?.selectedHome == ConstantsRoutes.MY_DATA,
                  context: context,
                  title: "Meus dados",
                  iconData: Icons.settings,
                  onPressed: () {
                    clearAllBloc();
                    blocHome.setPageActual(ConstantsRoutes.MY_DATA);
                    widget.drawerStatus ? Navigator.pop(context) : print("");
                  }),
              DrawerButton(
                  active: false,
                  context: context,
                  title: "Sair",
                  iconData: Icons.exit_to_app,
                  onPressed: () {
                    blocHome.dispose();
                    clearAllBloc();
                    Navigator.pop(context);
                  }),
            ],
          );
        });
  }
}





void clearAllBloc() {
  blocFinance.dispose();
  blocOrder.dispose();
  blocOrderService.dispose();
}

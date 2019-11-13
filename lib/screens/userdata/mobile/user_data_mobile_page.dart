import 'package:flutter/material.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';
import 'package:portal_grancoffee/bloc/userdata/user_data_bloc.dart';
import 'package:portal_grancoffee/component/line_view_widget.dart';
import 'package:portal_grancoffee/component/title_descritption_mobile_widget.dart';
import 'package:portal_grancoffee/models/userdata/user_data.dart';

class UserDataMobilePage extends StatefulWidget {
  @override
  _UserDataMobilePageState createState() => _UserDataMobilePageState();
}

class _UserDataMobilePageState extends State<UserDataMobilePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserData>(
        stream: blocUserData.userData,
        builder: (BuildContext context, AsyncSnapshot<UserData> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Container(
                width: 200,
                height: 200,
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                  strokeWidth: 5,
                ),
              );
            default:
              if (snapshot.hasError)
                return Container();
              else
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      titleDescriptionMobileWidget(
                        title: "CNPJ",
                        description: snapshot.data.cnpj,
                      ),
                      titleDescriptionMobileWidget(
                        title: "Razão Social",
                        description: snapshot.data.razao_social,
                      ),
                      titleDescriptionMobileWidget(
                        title: "Endereço cobrança",
                        description: snapshot.data.endereco_cobr,
                      ),
                      titleDescriptionMobileWidget(
                        title: "Endereço entrega",
                        description: snapshot.data.endereco_entrega,
                      ),
                      titleDescriptionMobileWidget(
                          title: "Responsável",
                          description: snapshot.data.responsavel,
                      ),
                      titleDescriptionMobileWidget(
                          title: "Telefone contato",
                          description: snapshot.data.email,
                          action: (){}),
                      titleDescriptionMobileWidget(
                          title: "E-mail de contato",
                          description: snapshot.data.telefone,
                          action: (){

                          }),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                );
          }
        });
  }


}

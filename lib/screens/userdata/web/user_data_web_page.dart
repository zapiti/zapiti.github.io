import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/userdata/user_data_bloc.dart';
import 'package:portal_grancoffee/component/title_description_widget.dart';
import 'package:portal_grancoffee/models/userdata/user_data.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';

class UserDataWebPage extends StatefulWidget {
  @override
  _UserDataWebPageState createState() => _UserDataWebPageState();
}

class _UserDataWebPageState extends State<UserDataWebPage> {
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
                    child: Card(
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                      Container(
                      margin: EdgeInsets.all(20),
                      child: Text(
                        "Meus dados",
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    titleDescriptionWidget(
                        title: "CNPJ:",
                        description: snapshot.data.razao_social),
                    SizedBox(
                      height: 8,
                    ),
                    titleDescriptionWidget(
                        title: "Razão Social:",
                        description: snapshot.data.razao_social),
                    SizedBox(
                      height: 8,
                    ),
                    titleDescriptionWidget(
                        title: "Endereço cobrança:",
                        description: snapshot.data.endereco_cobr),
                    SizedBox(
                      height: 8,
                    ),
                    titleDescriptionWidget(
                        title: "Endereço entrega:",
                        description: snapshot.data.endereco_entrega),
                    SizedBox(
                      height: 8,
                    ),
                    titleDescriptionWidget(
                        title: "Responsável:",
                        description: snapshot.data.responsavel),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        Text("Telefone contato:",
                            style: TextStyle(color: Colors.grey[400])),
                        SizedBox(width: 10),
                        Text(snapshot.data.telefone,
                            style: TextStyle(),
                            overflow: TextOverflow.ellipsis),
                        SizedBox(width: 10),
                        Container(
                            height: 25,
                            width: 75,
                            child: FlatButton(
                                color: AppTheme.colorPrimary,
                                child: Text("Editar", style: AppTheme.smallSize(
                                    color: AppTheme.whiteColor)),
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    new BorderRadius.circular(10.0),
                                    side: BorderSide(
                                        color: AppTheme.colorPrimary))))
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                      SizedBox(
                      width: 30,
                    ),
                    Text("E-mail de contato:",
                        style: TextStyle(color: Colors.grey[400])),
                    SizedBox(width: 10),
                    Text(snapshot.data.email,
                        style: TextStyle(),
                        overflow: TextOverflow.ellipsis),
                    SizedBox(width: 10),
                    MediaQuery
                        .of(context)
                        .size
                        .width > 400
                        ? Container(
                        height: 25,
                        width: 75,
                        child: FlatButton(
                            color: AppTheme.colorPrimary,
                            child: Text("Editar",style: AppTheme.smallSize(color: AppTheme.whiteColor)),
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            new BorderRadius.circular(10.0),
                            side:
                            BorderSide(color: AppTheme
                                .colorPrimary)))): SizedBox(width: 10)
          ],
          ),
          SizedBox(
          height: 30,
          ),
          ],
          )
          ,
          )
          ,
          );
        }
        });
  }
}

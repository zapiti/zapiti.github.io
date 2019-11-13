import 'package:flutter/material.dart';
import 'package:portal_grancoffee/bloc/navbar/nav_bar_bloc.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';
import 'package:portal_grancoffee/component/horizontal_list_image_widget.dart';
import 'package:portal_grancoffee/component/rounded_text_field_widget.dart';
import 'package:portal_grancoffee/component/title_descritption_mobile_widget.dart';

class NewOrderServiceMobilePage extends StatelessWidget {
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
              title: Text(
                "Criar OS",
                style: TextStyle(
                  fontSize: 24,
                  color: AppTheme.colorPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: SingleChildScrollView(
                padding: EdgeInsets.all(0),
                child: Column(children: <Widget>[
                  titleDescriptionMobileWidget(
                      title: "Tipo",
                      description: "Escolha um tipo",
                      action: () {}),
                  titleDescriptionMobileWidget(
                      title: "Data",
                      description: "Escolha um data",
                      action: () {}),
                  titleDescriptionMobileWidget(
                      title: "Máquina",
                      description: "Escolha uma maquina",
                      action: () {}),
                  Container(
                      margin: EdgeInsets.only(top: 20,right: 20,left: 20),
                      child: roundedTextFieldWidget(hint: "E-mail")),

                  Container(
                      margin: EdgeInsets.only(top: 20,right: 20,left: 20),
                      child: roundedTextFieldWidget(hint: "Tel. de contato")),
                  Container(
                      margin: EdgeInsets.all(20),
                      child: roundedTextFieldWidget(
                          hint: "Tel. de contato adicional")),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          hintText: "Descreva o problema",
                          border: OutlineInputBorder(),
                          fillColor: Colors.grey[300]),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 20,
                        ),
                        Text("Deseja anexar alguma evidência?",
                            style: AppTheme.normalSize()),
                      ]),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    child: Row(
                      children: horizontalListImageWidget(),
                    ),
                    scrollDirection: Axis.horizontal,
                  ),   SizedBox(
                    height: 40,
                  ),Container(
                    margin: EdgeInsets.only(right: 15,left: 15),
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: FlatButton(
                      shape:  RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      onPressed: () {},
                      color: AppTheme.colorPrimary,
                      child: Text(
                        "Salvar",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Raleway',
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),


                  SizedBox(
                    height: 40,
                  ),

                ]))));
  }
}

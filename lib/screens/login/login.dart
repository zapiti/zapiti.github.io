import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal_grancoffee/component/draw/half_circle.dart';
import 'package:portal_grancoffee/screens/home/home_screen.dart';
import 'package:portal_grancoffee/utils/theme/app_theme.dart';

class LoginScreeam extends StatefulWidget {
  LoginScreeam({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginScreeamState createState() => _LoginScreeamState();
}

class _LoginScreeamState extends State<LoginScreeam> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final email = new Container(
        decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            )),
        child: TextField(
          maxLines: 1,
          decoration: InputDecoration(
              hintText: "Usuario",
              enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  )),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(10.0),
                ),
              ),
              labelText: "Usuario"),
        ));

    final password = new Container(
        decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            )),
        child: TextField(
          maxLines: 1,
          decoration: InputDecoration(
              hintText: "Senha",
              enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  )),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(10.0),
                ),
              ),
              labelText: "Senha"),
        ));

    loginButton(Color color, Color textColor) => Container(
          margin: EdgeInsets.only(right: 20, left: 20),
          width: MediaQuery.of(context).size.width,
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            padding: EdgeInsets.all(20),
            color: color,
            child: Text('Entrar',
                style: TextStyle(
                    fontSize: 16,
                    color: textColor,
                    fontWeight: FontWeight.bold)),
          ),
        );

    forgotLabel(Color color) => FlatButton(
          child: Text(
            'Lembrar senha',
            style: TextStyle(color: color),
          ),
          onPressed: () {},
        );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                color: AppTheme.whiteColor,
              ),
            ],
          ),
          Center(
              child: Container(
            height: heightLoginContainer(context),
            width: widthLoginContainer(context),
            child: Card(
                elevation: 2.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: widthLoginSpace(context),

                      child: Stack(
                        alignment: AlignmentDirectional.centerStart,
                        children: <Widget>[
                          CustomPaint(
                            foregroundPainter:
                                HalfCircle(AppTheme.colorPrimary),
                          ),
                          Container(
                            margin: EdgeInsets.all(30),
                            child: Image.asset(
                              "assets/images/ic_gran_coffee.png",
                              scale: 0.3,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              MediaQuery.of(context).size.width < 700
                                  ? Container(
                                      height: 50,
                                      margin: EdgeInsets.all(20),
                                      child: Image.asset(
                                        "assets/images/ic_gran_coffee.png",
                                        scale: 0.1,
                                      ),
                                    )
                                  : SizedBox(height: 20.0),
                              email,
                              SizedBox(height: 8.0),
                              password,
                              SizedBox(height: 24.0),
                              loginButton(
                                  MediaQuery.of(context).size.width < 700
                                      ? AppTheme.whiteColor
                                      : AppTheme.colorPrimary,
                                  MediaQuery.of(context).size.width < 700
                                      ? AppTheme.colorPrimary
                                      : AppTheme.whiteColor),
                              forgotLabel(
                                  MediaQuery.of(context).size.width < 700
                                      ? AppTheme.whiteColor
                                      : AppTheme.colorPrimary),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          )),
        ],
      ),
    );
  }
}

double heightLoginContainer(BuildContext context) {
  return MediaQuery.of(context).size.height > 1000
      ? MediaQuery.of(context).size.height / 1.8
      : MediaQuery.of(context).size.height / 1.5;
}

double widthLoginContainer(BuildContext context) {
  return MediaQuery.of(context).size.width > 1000
      ? MediaQuery.of(context).size.width / 1.8
      : MediaQuery.of(context).size.width / 1.2;
}

double widthLoginSpace(BuildContext context) {
  return MediaQuery.of(context).size.width < 700
      ? 0
      : MediaQuery.of(context).size.width < 1000
          ? MediaQuery.of(context).size.width / 4
          : MediaQuery.of(context).size.width / 5;
}

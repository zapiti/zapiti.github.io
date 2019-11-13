import 'package:flutter/cupertino.dart';
import 'package:portal_grancoffee/models/userdata/user_data.dart';
import 'package:rxdart/rxdart.dart';

class UserDataBloc {
  final _userDataInfo = BehaviorSubject<UserData>();

  Observable<UserData> get userData => _userDataInfo.stream;

  Sink<UserData> get userValue => _userDataInfo.sink;

  getUserData() async {
    var value = UserData(
        cnpj: "12.234.231/0001-89",
        razao_social: 'Empresa do cara',
        endereco_cobr: 'Rua José Manuel Filho , 312 - Parque Floresta',
        endereco_entrega: 'Rua José Manuel Filho , 312 - Parque Floresta',
        responsavel: "Fernando da silva",
        telefone: "(34) 3333-3333",
        email: "emaildocliente@empresa1.com.br");

    await Future.delayed(Duration(seconds: 1), () => userValue.add(value));
  }

  @mustCallSuper
  dispose() async {
    await _userDataInfo.drain();
    await _userDataInfo.close();
  }
}

final blocUserData = UserDataBloc();

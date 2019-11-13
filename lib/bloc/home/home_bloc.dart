import 'package:flutter/cupertino.dart';
import 'package:portal_grancoffee/models/home/home.dart';
import 'package:portal_grancoffee/utils/constants_routes.dart';
import 'package:portal_grancoffee/utils/constants_routes.dart';
import 'package:rxdart/rxdart.dart';

BuildContext meuContextoGlobal;

class HomeBloc {
  final _homeInfo = BehaviorSubject<Home>();




  Observable<Home> get homeData => _homeInfo.stream;

  Sink<Home> get homeValue => _homeInfo.sink;

  getHome() async {
    var value = Home(
        name: "Carlos de Oliveira Peres",
        url:
            'https://assets1.ignimgs.com/thumbs/userUploaded/2019/5/29/drstone-1559174341319.jpg',
        employers: ["Empresa1", "Empresa2", "Empresa3", "Empresa4"],
        selectedEmployer: "Empresa1");

    await Future.delayed(Duration(seconds: 1), () => homeValue.add(value));
  }

  setEmployersActual(String selected) {
    homeData.firstWhere((home) {
      home.selectedEmployer = selected;
      homeValue.add(home);
      return true;
    });
  }

  setPageActual(String selected,{int delay = 0,bool delayInState = false}) async {
      BuildContext context = meuContextoGlobal;
      if (!delayInState){
        _setStateSelected(selected);
      }
      await  Future.delayed(new Duration(milliseconds: delay), () {
        if (delayInState){
          _setStateSelected(selected);
        }
        Navigator.of(context).pushNamed(selected);
      });
  }

  void _setStateSelected(String selected) {
     homeData.firstWhere((home) {
      home.selectedHome = selected;
      homeValue.add(home);
      return true;
    });
  }

  @mustCallSuper
  dispose() async {
    await _homeInfo.drain();
    await _homeInfo.close();
  }
}

final blocHome = HomeBloc();

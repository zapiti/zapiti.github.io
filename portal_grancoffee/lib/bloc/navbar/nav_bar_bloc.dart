
import 'package:flutter/cupertino.dart';
import 'package:portal_grancoffee/models/navbar/navbar.dart';
import 'package:rxdart/rxdart.dart';

class NavBarBloc {
  final _navInfo = BehaviorSubject<NavBar>();
  Observable<NavBar> get navData => _navInfo.stream;
  Sink<NavBar> get homeValue => _navInfo.sink;

  getNav()  {
    homeValue.add(NavBar());
  }
  seShowHideNav(bool selected) {
    navData.firstWhere((nav) {
      nav.showNav = selected;
      homeValue.add(nav);
      return true;
    });
  }
  @mustCallSuper
  dispose() async {
    await _navInfo.drain();
    await _navInfo.close();
  }
}

final blocNavBar = NavBarBloc();

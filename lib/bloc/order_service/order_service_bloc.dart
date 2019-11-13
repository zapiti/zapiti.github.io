import 'package:flutter/material.dart';
import 'package:portal_grancoffee/models/order_service/filter_order_service.dart';
import 'package:portal_grancoffee/models/order_service/order_service.dart';
import 'package:rxdart/rxdart.dart';

class OrderServiceBloc {
  final _orderInfo = BehaviorSubject<List<OrderService>>();
  final _contractOrderService = BehaviorSubject<FilterOrderService>();
  final _listTempOrderService = List<OrderService>();

  Observable<List<OrderService>> get orderData => _orderInfo.stream;

  Sink<List<OrderService>> get orderValue => _orderInfo.sink;

  Observable<FilterOrderService> get allContract =>
      _contractOrderService.stream;

  Sink<FilterOrderService> get contractValue => _contractOrderService.sink;

  getOrders() async {
    var listOrders = List<OrderService>();
    for (var i = 0; i < 30; i++) {
      var value = OrderService(
          os: i,
          data: "${i}/10/2019",
          tipo: i % 2 == 0 ? "Tecnico" : "Sugest./Reclam",
          endereco: i % 2 == 0
              ? "Rua jose Manuel filho"
              : "Rua franscisco de assins 15165 sao jose dos campos",
          descricao: i % 2 == 0
              ? "Por falta de pagamento o dragao matou o rato de agua"
              : "Era uma vez um jogo chamado jogo do trono",
          id: 1,
          status: i % 2 == 0
              ? OrderServiceStatus.CONCLUIDO
              : OrderServiceStatus.PENDENTE,
          contrato: i % 2 == 0 ? "Batata" : "Feijao");

      listOrders.add(value);
    }
    _listTempOrderService.addAll(listOrders);
    contractValue
        .add(FilterOrderService(["Selecione um contato", "Batata", "Feijao"]));
    await Future.delayed(
        Duration(seconds: 1), () => orderValue.add(listOrders));
  }

  setContactSelected(String selected) {
    allContract.firstWhere((finance) {
      finance.selectedContact = selected;
      contractValue.add(finance);
      return true;
    });
    if (selected == null) {
      orderValue.add(_listTempOrderService);
    } else {
      var list = _listTempOrderService
          .where((element) => element.contrato == selected)
          .toList();
      orderValue.add(list);
    }
  }

  @mustCallSuper
  dispose() async {
    await _orderInfo.drain();
    await _orderInfo.close();
    await _contractOrderService.drain();
    await _contractOrderService.close();
  }
}

final blocOrderService = OrderServiceBloc();

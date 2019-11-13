import 'package:flutter/material.dart';
import 'package:portal_grancoffee/models/order/filter_order.dart';
import 'package:portal_grancoffee/models/order/order.dart';
import 'package:rxdart/rxdart.dart';

class OrderBloc {
  final _orderInfo = BehaviorSubject<List<Order>>();
  final _contractOrder = BehaviorSubject<FilterOrder>();
  final _listTempOrder = List<Order>();

  Observable<List<Order>> get orderData => _orderInfo.stream;

  Sink<List<Order>> get orderValue => _orderInfo.sink;

  Observable<FilterOrder> get allContract => _contractOrder.stream;

  Sink<FilterOrder> get contractValue => _contractOrder.sink;

  getOrders() async {
    var listOrders = List<Order>();
    for (var i = 0; i < 30; i++) {
      var value = Order(
          numPedido: i,
          data: "${i}/10/2019",
          itens: i,
          total: (i * 354.335818),
          previsao: "${i}/12/2019",
          id: 1,
          status: i % 2 == 0 ? OrderStatus.APROVADO : OrderStatus.ENTREGUE,
          contrato: i % 2 == 0 ? "Batata" : "Feijao");

      listOrders.add(value);
    }
    contractValue
        .add(FilterOrder(["Selecione um contato", "Batata", "Feijao"]));
    _listTempOrder.addAll(listOrders);
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
      orderValue.add(_listTempOrder);
    } else {
      var list = _listTempOrder
          .where((element) => element.contrato == selected)
          .toList();
      orderValue.add(list);
    }
  }

  @mustCallSuper
  dispose() async {
    await _orderInfo.drain();
    await _orderInfo.close();

    await _contractOrder.drain();
    await _contractOrder.close();
  }
}

final blocOrder = OrderBloc();

import 'package:flutter/cupertino.dart';
import 'package:portal_grancoffee/models/finance/finance.dart';
import 'package:portal_grancoffee/models/initapp/banner_entity.dart';
import 'package:portal_grancoffee/models/order/order.dart';
import 'package:portal_grancoffee/models/order_service/order_service.dart';
import 'package:rxdart/rxdart.dart';

class InitialBloc {
  final _bannerAll = BehaviorSubject<List<BannerEntity>>();
  final _financeAll = BehaviorSubject<List<Finance>>();
  final _serviceOrderAll = BehaviorSubject<List<OrderService>>();
  final _orderAll = BehaviorSubject<List<Order>>();

  Observable<List<BannerEntity>> get allBanner => _bannerAll.stream;
  Sink<List<BannerEntity>> get bannerValue => _bannerAll.sink;

  Observable<List<Finance>> get allFinance => _financeAll.stream;
  Sink<List<Finance>> get financeValue => _financeAll.sink;

  Observable<List<OrderService>> get allOrderService => _serviceOrderAll.stream;
  Sink<List<OrderService>> get orderServiceValue => _serviceOrderAll.sink;

  Observable<List<Order>> get allOrder => _orderAll.stream;
  Sink<List<Order>> get orderValue => _orderAll.sink;

  getBanners() async {
    var listOrders = List<BannerEntity>();
    for (var i = 0; i < 5; i++) {
      var value = BannerEntity(
          "https://novonegocio.com.br/wp-content/uploads/2014/05/20-Produtos-Para-Vender-e-Lucrar.jpg");
      listOrders.add(value);
    }
    await Future.delayed(
        Duration(seconds: 1), () => bannerValue.add(listOrders));
  }

  getTitlesFinance() async {
    var listFinance = List<Finance>();
    for (var i = 0; i < 5; i++) {
      var value = Finance(
          fatura: i,
          dataVenc: "${i}/10/2019",
          valores: (i * 354.335818),
          natureza: i % 2 == 0 ? "Serviço" : "Produto",
          id: 1,
          status: i % 2 == 0 ? FinanceStatus.PAGO : FinanceStatus.EM_ABERTO,
          contrato: i % 2 == 0 ? "Batata" : "Feijao");

      listFinance.add(value);
    }
    await Future.delayed(
        Duration(seconds: 1), () => financeValue.add(listFinance));
  }

  getCallsOS() async {
    var listOrders = List<OrderService>();
    for (var i = 0; i < 5; i++) {
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

    await Future.delayed(
        Duration(seconds: 1), () => orderServiceValue.add(listOrders));
  }

  getOrders() async {
    var listOrders = List<Order>();
    for (var i = 0; i < 5; i++) {
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
    await Future.delayed(
        Duration(seconds: 1), () => orderValue.add(listOrders));
  }

  @mustCallSuper
  dispose() async {
    await _bannerAll.drain();
    await _bannerAll.close();

    await _financeAll.drain();
    await _financeAll.close();

    await _serviceOrderAll.drain();
    await _serviceOrderAll.close();

    await _orderAll.drain();
    await _orderAll.close();
  }
}

final blocInitial = InitialBloc();

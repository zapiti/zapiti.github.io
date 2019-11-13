import 'package:flutter/material.dart';
import 'package:portal_grancoffee/models/finance/filter_finance.dart';
import 'package:portal_grancoffee/models/finance/finance.dart';
import 'package:rxdart/rxdart.dart';

class FinanceBloc {
  final _financeInfo = BehaviorSubject<List<Finance>>();


  final _contractFinance = BehaviorSubject<FiterFinance>();

  Observable<List<Finance>> get financeData => _financeInfo.stream;
  Sink<List<Finance>> get financeValue => _financeInfo.sink;



  Observable<FiterFinance> get allContract => _contractFinance.stream;
  Sink<FiterFinance> get contractValue => _contractFinance.sink;

  final _listTempFinance = List<Finance>();

  getFinance() async {
    var listFinance = List<Finance>();
    for (var i = 0; i < 30; i++) {
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
    contractValue.add(FiterFinance(["Selecione um contato","Batata" , "Feijao"]));
    _listTempFinance.clear();
    _listTempFinance.addAll(listFinance);

    await Future.delayed(
        Duration(seconds: 1), () => financeValue.add(listFinance));
  }

  
  setContactSelected(String selected) async{
    allContract.firstWhere((finance) {
      finance.selectedContact = selected;
      contractValue.add(finance);
      return true;
    });
    if (selected == null){
      financeValue.add(_listTempFinance);
    }else{
         var list = _listTempFinance.where((element) => element.contrato == selected).toList();
        financeValue.add(list);
    }
  }

  @mustCallSuper
  dispose() async {
    await _financeInfo.drain();
    await _financeInfo.close();
    await _contractFinance.drain();
    await _contractFinance.close();

  }
}

final blocFinance = FinanceBloc();

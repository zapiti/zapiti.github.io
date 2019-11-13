enum FinanceStatus { PAGO, EM_ABERTO, VENCIDO }

class Finance {
  final int fatura;
  final String dataVenc;
  final double valores;
  final String natureza;
  final FinanceStatus status;
  final int id;
  final String contrato;
  String selectedContact;

  Finance(
      {this.fatura,
      this.dataVenc,
      this.valores,
      this.natureza,
      this.status,
      this.id,
      this.contrato});
}

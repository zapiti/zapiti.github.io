enum OrderStatus { PENDENTE, APROVADO, ENTREGUE, EM_TRANSPORTE }

class Order {
  final int numPedido;
  final String data;
  final int itens;
  final double total;
  final String previsao;
  final OrderStatus status;
  final int id;
  final String contrato;

  Order(
      {this.numPedido,
      this.data,
      this.itens,
      this.total,
      this.previsao,
      this.status,
      this.id,
      this.contrato});
}

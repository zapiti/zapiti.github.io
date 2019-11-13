enum OrderServiceStatus { PENDENTE, CONCLUIDO }

class OrderService {
  final int os;
  final String data;
  final String tipo;
  final String endereco;
  final String descricao;
  final OrderServiceStatus status;
  final int id;
  final String contrato;

  OrderService(
      {this.os,
      this.data,
      this.tipo,
      this.endereco,
      this.descricao,
      this.status,
      this.id,
      this.contrato});
}

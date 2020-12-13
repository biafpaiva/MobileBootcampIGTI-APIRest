class Account {
  int id, agencia, conta, balance;
  String nome;

  Account.fromJson(dynamic json)
      : id = json['id'],
        agencia = json['agencia'],
        conta = json['conta'],
        nome = json['name'],
        balance = json['balance'];

  @override
  String toString() {
    return '{ id = ${id}, agencia = ${agencia}, conta = ${conta}, nome = ${nome}, saldo = ${balance}}';
  }
}

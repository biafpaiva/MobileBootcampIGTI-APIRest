import 'account.dart';
import "package:collection/collection.dart";

int totalDepositosAgencia(List<Account> accounts) {
  var total = accounts
      .map((title) => title.balance)
      .reduce((value, element) => value + element);
  return total;
}

int contasMaisCem(List<Account> accounts) {
  var total = accounts.where((element) => element.balance > 100).toList();
  return total.length;
}

int contasMaisCemAgenciaTresTres(List<Account> accounts) {
  var total = accounts
      .where((element) => element.balance > 100 && element.agencia == 33)
      .toList();
  return total.length;
}

List<Account> ordenaListaSaldo(List<Account> accounts) {
  var listaOrdenada = [...accounts];
  listaOrdenada.sort((a, b) => a.balance.compareTo(b.balance));
  return listaOrdenada;
}

int contaMaiorSaldo(List<Account> accounts) {
  var listaOrdenada = ordenaListaSaldo(accounts);
  return listaOrdenada[listaOrdenada.length - 1].agencia;
}

int totalMaioresSaldos(List<Account> accounts) {
  var contasPorAgencia = groupBy(accounts, (element) => element.agencia);
  var total = 0;
  contasPorAgencia.forEach((key, value) {
    var listaOrdenada = ordenaListaSaldo(value);
    total += listaOrdenada[listaOrdenada.length - 1].balance;
  });
  return total;
}

String maiorSaldoAgenciaDez(List<Account> accounts) {
  var listaOrdenada = ordenaListaSaldo(
      accounts.where((element) => element.agencia == 10).toList());
  return listaOrdenada[listaOrdenada.length - 1].nome;
}

String menorSaldoAgenciaQuatroSete(List<Account> accounts) {
  var listaOrdenada = ordenaListaSaldo(
      accounts.where((element) => element.agencia == 47).toList());
  return listaOrdenada[0].nome;
}

String menoresSaldosAgenciaQuatroSete(List<Account> accounts) {
  var listaOrdenada = ordenaListaSaldo(
      accounts.where((element) => element.agencia == 47).toList());
  var menoresSaldos =
      listaOrdenada.take(3).map((title) => title.nome).join(", ");
  ;
  return menoresSaldos;
}

int numClientesAgenciaQuatroSete(List<Account> accounts) {
  var clientesAgenciaQuatroSete =
      accounts.where((element) => element.agencia == 47).toList();
  return clientesAgenciaQuatroSete.length;
}

int mariaAgenciaQuatroSete(List<Account> accounts) {
  var clientesMaria = accounts
      .where(
          (element) => element.agencia == 47 && element.nome.contains('Maria'))
      .toList();
  return clientesMaria.length;
}

int proximaId(List<Account> accounts) {
  var listaOrdenada = [...accounts];
  listaOrdenada.sort((a, b) => a.id.compareTo(b.id));
  var prxId = listaOrdenada[listaOrdenada.length - 1].id + 1;
  return prxId;
}

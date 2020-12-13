import 'dart:math';

import 'package:account/account.dart';
import "package:test/test.dart";
import 'package:account/questoesdesafio.dart';
import 'package:http/http.dart';
import 'dart:convert';

Future<List<Account>> carregarAccounts() async {
  var url_json = 'https://igti-film.herokuapp.com/api/accounts';
  var result = await get(url_json);
  var json = jsonDecode(result.body);
  return List<Account>.from(
      json.map((item) => Account.fromJson(item)).toList());
}

void main() async {
  var accounts = await carregarAccounts();
  group("Functions", () {
    test("test totalDepositosAgencia", () {
      expect(totalDepositosAgencia(accounts), equals(77973));
    });
    test("test contasMaisCem", () {
      expect(contasMaisCem(accounts), equals(104));
    });
    test("test contasMaisCemAgenciaTresTres", () {
      expect(contasMaisCemAgenciaTresTres(accounts), equals(23));
    });
    test("test contaMaiorSaldo", () {
      expect(contaMaiorSaldo(accounts), equals(10));
    });
    test("test totalMaioresSaldos", () {
      expect(totalMaioresSaldos(accounts), equals(18736));
    });
    test("test maiorSaldoAgenciaDez", () {
      expect(maiorSaldoAgenciaDez(accounts), equals("Giovanna Silva Dias"));
    });
    test("test menorSaldoAgenciaQuatroSete", () {
      expect(menorSaldoAgenciaQuatroSete(accounts), equals("Glaucio de Souza"));
    });
    test("test menoresSaldosAgenciaQuatroSete", () {
      expect(menoresSaldosAgenciaQuatroSete(accounts),
          equals("Glaucio de Souza, Jorge Ivan Jimenez, Pedro Luis Fragoso"));
    });
    test("test numClientesAgenciaQuatroSete", () {
      expect(numClientesAgenciaQuatroSete(accounts), equals(30));
    });
    test("test mariaAgenciaQuatroSete", () {
      expect(mariaAgenciaQuatroSete(accounts), equals(2));
    });
    test("test proximaId", () {
      expect(proximaId(accounts), equals(121));
    });
  });
}

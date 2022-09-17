import 'package:consumoapi/models/cliente_model.dart';

class AgendamentosModel {
  static List<Cliente>? agendamentosList = [];

  void adicionaAgendamento(Cliente value) {
    agendamentosList?.add(value);
  }

  List<Cliente>? get listaAgendamentos {
    return agendamentosList;
  }
}

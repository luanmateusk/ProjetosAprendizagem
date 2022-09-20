import 'package:consumoapi/models/agendamento_model.dart';

class AgendamentosModel {
  static List<Agendamento>? _agendamentosList = [];

  void adicionaAgendamento(Agendamento value) {
    _agendamentosList?.add(value);
  }

  List<Agendamento>? get listaAgendamentos {
    return _agendamentosList;
  }
}

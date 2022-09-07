import 'package:conversor/models/historico_model.dart';
import 'package:flutter/material.dart';
import '../models/calculo_model.dart';

class HistoricoController extends ChangeNotifier {
  Historico _historico = new Historico();
  Historico get getHistorico => _historico; //? entender

  void set novoCalculoLista(String? input) {
    _historico.addCalculo(input!);
    notifyListeners();
  }
}
  /*late Calculo calculoRealizado;
  DateTime horaCalculo=DateTime.now();

  Historico _historico = new Historico();

    void set addRegistro(double? input) {
    _calculo.input = input;
    notifyListeners();
  }


  HistoricoController(this.calculoRealizado, this.horaCalculo);
}
*/
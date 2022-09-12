import 'package:conversor/models/historico_model.dart';
import 'package:flutter/material.dart';
import '../models/calculo_model.dart';

class HistoricoController extends ChangeNotifier {
  Historico historicoX = new Historico();
  Historico get getSalvaLog => historicoX;

  
  void renew() {
    historicoX = new Historico();
    notifyListeners();
  }

  void set valoresLog(List<String>? valoresLog) {
    historicoX.valoresLog!.addAll(valoresLog!);
    historicoX.qtdItens++;
    //historicoX.existeItens=true;
    notifyListeners();
  }

  void set logString(String? logString) {
    historicoX.logString = logString;
  }

  String? listaLog() {
    for (int i = 0; i < historicoX.valoresLog!.length; i++) {
      logString = logString! + historicoX.valoresLog![i] + '\n';
    }
    return logString;
  }

  List<String>? get salvaLog => historicoX.valoresLog;
  String? get logString => historicoX.logString;

  void limpaLog() {
    historicoX.limpaLog();
    notifyListeners();
  }
}

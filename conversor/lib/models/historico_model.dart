import 'package:flutter/material.dart';

import 'calculo_model.dart';

class Historico {
  static List<String>? _calculosHistorico = [];
  late DateTime horaCalculo;

  void addCalculo(String value) {
    _calculosHistorico!.add(value);
  }

  get calculosHistorico => calculosHistorico;

 set calculosHistorico( value) => calculosHistorico = value;

  get getHoraCalculo => this.horaCalculo;

 set setHoraCalculo( horaCalculo) => this.horaCalculo = horaCalculo;

}

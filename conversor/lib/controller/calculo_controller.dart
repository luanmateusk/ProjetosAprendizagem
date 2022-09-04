import 'package:flutter/material.dart';
import 'package:conversor/models/calculo_model.dart';
import 'package:flutter/foundation.dart';

class CalculoController extends ChangeNotifier {
  Calculo _calculo = new Calculo("Quilômetros", "Milhas", 1, 0.621371);

  Calculo get getCalculo => _calculo;

  void set input(double? input) {
    _calculo.input = input;
    notifyListeners();
  }

  void set nomeFrom(nomeFrom) {
    _calculo.nomeFrom = nomeFrom;
    notifyListeners();
  }

  void set nomeTo(nomeTo) {
    _calculo.nomeTo = nomeTo;
    notifyListeners();
  }

  void set output(double? output) {
    _calculo.output = output;
    notifyListeners();
  }

  void converter() {
    String conversao = this.nomeFrom! + this.nomeTo!;
    ['Milhas', 'Quilômetros', 'Jarda'];
    switch (conversao) {
      case "MilhasQuilômetros":
        // do something
        break;
      case "MilhasJarda":
        // do something else
        break;

      case "QuilômetrosMilhas":
        //_calculo.output!(2);

        //(this.input!*0.621371);
        break;

      case "QuilômetrosJarda":
        // do something else
        break;

      case "JardaMilhas":
        // do something else
        break;

      case "JardaQuilômetros":
        // do something else
        break;

      case "QuilômetrosQuilômetros":
        // do something else
        break;
      case "MilhasMilhas":
        // do something else
        break;
      case "JardaJarda":
        // do something else
        break;
    }
  }

  double? get input => _calculo.input;
  String? get nomeFrom => _calculo.nomeFrom;
  String? get nomeTo => _calculo.nomeTo;
  double? get output => _calculo.output;
}

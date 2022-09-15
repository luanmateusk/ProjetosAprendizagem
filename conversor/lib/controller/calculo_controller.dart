import 'package:flutter/material.dart';
import 'package:conversor/models/calculo_model.dart';
import 'package:flutter/foundation.dart';

class CalculoController extends ChangeNotifier {
  Calculo _calculo = new Calculo("Quilômetros", "Milhas", 0, 0);

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

  void converter(CalculoController calculoX) {
    String conversao = this.nomeFrom! + this.nomeTo!;
    ['Milhas', 'Quilômetros', 'Jarda'];
    switch (conversao) {
      case "MilhasQuilômetros":
        calculoX.output = (this.input!*1.60934);
        break;
      case "MilhasJarda":
        calculoX.output = (this.input!*0.000568182);
        break;

      case "QuilômetrosMilhas":
        calculoX.output = (this.input!*0.621371);
        break;

      case "QuilômetrosJarda":
        calculoX.output = (this.input!*1093.61);
        break;

      case "JardaMilhas":
        calculoX.output = (this.input!*0.000568182);
        break;

      case "JardaQuilômetros":
        calculoX.output = (this.input!*0.0009144);
        break;

      case "QuilômetrosQuilômetros":
        calculoX.output = (this.input!*1);
        break;
      case "MilhasMilhas":
        calculoX.output = (this.input!*1);
        break;
      case "JardaJarda":
        calculoX.output = (this.input!*1);
        break;
    }
  }

  double? get input => _calculo.input;
  String? get nomeFrom => _calculo.nomeFrom;
  String? get nomeTo => _calculo.nomeTo;
  double? get output => _calculo.output;
}

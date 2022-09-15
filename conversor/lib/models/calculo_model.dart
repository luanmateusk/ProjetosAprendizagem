import 'package:flutter/material.dart';

class Calculo {
  double? input;
  String? nomeFrom;
  String? nomeTo;
  double? output;

  Calculo(this.nomeFrom, this.nomeTo, this.input, this.output);

  void set setInput(input) => this.input = input;
  void set setNomeFrom(nomeFrom) => this.nomeFrom = nomeFrom;
  void set setNomeTo(nomeTo) => this.nomeTo = nomeTo;
  void set setoutput(output) => this.output = output;
  
}

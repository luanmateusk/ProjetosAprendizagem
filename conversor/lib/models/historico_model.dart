import 'package:flutter/material.dart';

class Historico {
  static List<String>? _calculosHistorico = [];

  get calculosHistorico => _calculosHistorico;

  void addCalculo(String value) {
    _calculosHistorico!.add(value);
  }
}

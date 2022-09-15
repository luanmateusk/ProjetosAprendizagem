import 'package:flutter/material.dart';

class Historico {
  static List<String>? _valoresLog = [];
  static String? _logString = '';
  static int _qtdItens = 0;
  static bool _existeItens = false;

  get qtdItens => _qtdItens;
  set qtdItens(value) => _qtdItens++;

  get existeItens => _existeItens;

  set existeItens(value) => _existeItens = value;

  Historico() {}

  List<String>? get valoresLog => _valoresLog;
  String? get logString => _logString;

  // ignore: recursive_getters

  static void setExisteValores(bool value) {
    _existeItens = value;
  }

  static void setValoreslog(String value) {
    _valoresLog!.add(value);
    _qtdItens++;
  }

  void set valoresLog(List<String>? valoresLog) {
    _valoresLog!.addAll(valoresLog!);
  }

  void set logString(String? logString) {
    _logString = logString;
  }

  void limpaLog() {
    _valoresLog!.clear();
  }
}

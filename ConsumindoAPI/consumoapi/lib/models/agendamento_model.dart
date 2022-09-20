import 'package:consumoapi/models/endereco_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; //

class Agendamento {
  int? id;
  String? nome;
  String? sobrenome;
  Endereco endereco = new Endereco();
  Map<String, String>? contato;
  String? cep;
  DateTime? diaAgendamento;
  TimeOfDay? horaAgendamento;


  Agendamento(nome, sobrenome, cepY) {
    this.nome = nome;
    this.sobrenome = sobrenome;
    this.cep = cepY;
    
  }

  

  get getId => this.id;

  set setId(id) => this.id = id;

  get getNome => this.nome;

  void setNome(nome) => this.nome = nome;

  get getSobrenome => this.sobrenome;

  set setSobrenome(sobrenome) => this.sobrenome = sobrenome;

  get getEndereco => this.endereco;

  set setEndereco(endereco) => this.endereco = endereco;

  get getContato => this.contato;

  set setContato(contato) => this.contato = contato;
}

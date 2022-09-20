import 'package:consumoapi/models/agendamentos_model.dart';
import 'package:consumoapi/models/agendamento_model.dart';
import 'package:consumoapi/view/agendamentos.dart';
import 'package:flutter/material.dart';

class InfoAgendamento extends StatelessWidget {
  final Agendamento agendamento;
  InfoAgendamento(this.agendamento);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            //padding: EdgeInsets.all(1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                Text(agendamento.nome.toString()),
                Text(agendamento.endereco.bairro.toString()),
                Text(agendamento.endereco.logradouro.toString() + " , " +agendamento.endereco.numeroCasa.toString()),
                Text(agendamento.endereco.localidade.toString()),
                Text(agendamento.diaAgendamento.toString())
              ],
            )));
  }
}

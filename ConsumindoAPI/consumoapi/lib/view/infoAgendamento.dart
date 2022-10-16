import 'package:consumoapi/models/agendamentos_model.dart';
import 'package:consumoapi/models/agendamento_model.dart';
import 'package:consumoapi/view/agendamentos.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InfoAgendamento extends StatelessWidget {
  final Agendamento agendamento;
  InfoAgendamento(this.agendamento);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            height: 400,
            width: 400,
              decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0),
                            bottomLeft: Radius.circular(50.0),
                            bottomRight: Radius.circular(50.0),
                            )),
            
            
              //padding: EdgeInsets.all(1),
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
           
                  
                  children: [
                    Text(agendamento.nome.toString()),
                    Text(agendamento.endereco.bairro.toString()),
                    Text(agendamento.endereco.logradouro.toString() + " , " +agendamento.endereco.numeroCasa.toString()),
                    Text(agendamento.endereco.localidade.toString()),


                    Text(DateFormat('dd/MM/yyyy').format(agendamento.diaAgendamento!)),
                  ],
                ),
              )),
        ));
  }
}

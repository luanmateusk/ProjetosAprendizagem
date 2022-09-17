import 'package:consumoapi/models/agendamentos_model.dart';
import 'package:flutter/material.dart';

class Agendamentos extends StatefulWidget {
  const Agendamentos({Key? key}) : super(key: key);

  @override
  State<Agendamentos> createState() => _AgendamentosState();
}

AgendamentosModel listaAg = new AgendamentosModel();

class _AgendamentosState extends State<Agendamentos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView(
              
              
      children: listaAg.listaAgendamentos!.map((strone) {
        return Card(
          
          child: Text(strone.nome.toString()),
          
          margin: EdgeInsets.all(25),
          
       
          color: Colors.green[100],
        );
      }).toList(),
    )));
  }
}

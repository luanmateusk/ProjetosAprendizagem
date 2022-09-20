import 'package:consumoapi/models/agendamentos_model.dart';
import 'package:consumoapi/view/infoAgendamento.dart';
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
        body: ListView.builder(
           itemCount: listaAg.listaAgendamentos?.length,
          itemBuilder: (context,index){
            
             return Card(
               child: ListTile(
              
                 title: Text(listaAg.listaAgendamentos![index].nome.toString()),
                 subtitle: Text(listaAg.listaAgendamentos![index].endereco.bairro.toString()),
                 leading: SizedBox(
                   width: 50,
                   height: 50, 
                   child: Row(children: [Icon(Icons.house)]),
                   
                 ),
                 onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>InfoAgendamento(listaAg.listaAgendamentos![index])));
                 },
               ),
             );
          }
      ));
  }
}

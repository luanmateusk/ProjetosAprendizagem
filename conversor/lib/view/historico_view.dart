import 'package:conversor/controller/historico_controller.dart';
import 'package:conversor/models/historico_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//final itens = List<String>.generate(100, (index) => "Cálculo $index");
final List<String> itens = ['Milhas', 'Quilômetros', 'Jarda'];

class HistoricoView extends StatelessWidget {
  const HistoricoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body:
 Text("teste")));
  }
}

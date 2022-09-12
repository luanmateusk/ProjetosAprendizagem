// ignore_for_file: deprecated_member_use, prefer_interpolation_to_compose_strings
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
// ignore: prefer_interpolation_to_compose_strings

import 'package:conversor/controller/calculo_controller.dart';
import 'package:conversor/controller/historico_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/listaValoresMedidasFrom.dart';
import '../models/calculo_model.dart';
import '../models/historico_model.dart';

class ConversorView extends StatelessWidget {
  bool calculoRealizado = false;
  static const List<String> list = ['Milhas', 'Quilômetros', 'Jarda'];

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new

    // ignore: unnecessary_new
    return new Scaffold(
        backgroundColor: Color.fromARGB(255, 163, 64, 64),
        body: Consumer<CalculoController>(builder: (context, calculo, child) {
          return ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            TextField(
                              //controller: TextEditingController ( text: calculo.input.toString()),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: "Insira o valor",
                                  label: Text("Valor Inicial")),
                              onChanged: (_valorInicial) {
                                if (_valorInicial != "") {
                                  //quando o valor inicial estiver preenchido executa...
                                  calculo.input = double.parse(_valorInicial);
                                  calculo.converter(calculo);

                                  //calculo.output = 2;
                                }
                              },
                            ),
                            // SizedBox(height: 20),
                            // Text("De"),
                            // SizedBox(height: 10),
                            DropdownButton<String>(
                                isExpanded: true,
                                value: calculo.nomeFrom,
                                items: list.map((e) {
                                  return DropdownMenuItem<String>(
                                    child: Text(e),
                                    value: e,
                                  );
                                }).toList(),
                                onChanged: (_nomeFrom) {
                                  calculo.nomeFrom = _nomeFrom;
                                }),
                            // SizedBox(height: 10),
                            // Text("Para"),
                            DropdownButton<String>(
                                isExpanded: true,
                                value: calculo.nomeTo,
                                items: list.map((e) {
                                  return DropdownMenuItem<String>(
                                    child: Text(e),
                                    value: e,
                                  );
                                }).toList(),
                                onChanged: (_nomeFrom) {
                                  calculo.nomeTo = _nomeFrom;
                                }),
                            TextField(
                              controller: TextEditingController(
                                  text: calculo.output.toString()),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  label: Text("Valor Convertido")),
                              onChanged: (_valorConvertido) {
                                _valorConvertido = calculo.output.toString();
                              },
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  calculo.converter(calculo);
                                  Historico.setValoreslog(
                                      calculo.input.toString() +
                                          " " +
                                          calculo.nomeFrom.toString() +
                                          " igual á " +
                                          calculo.output.toString() +
                                          " " +
                                          calculo.nomeTo.toString());

                                  Historico.setExisteValores(true);
                                },
                                child: Text("Registrar conversão")),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }));
  }
}

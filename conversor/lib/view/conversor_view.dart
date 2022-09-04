// ignore_for_file: deprecated_member_use, prefer_interpolation_to_compose_strings
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
// ignore: prefer_interpolation_to_compose_strings

import 'package:conversor/controller/calculo_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/listaValoresMedidasFrom.dart';
import '../models/calculo_model.dart';

class ConversorView extends StatelessWidget {
  bool calculoRealizado = false;
  static const List<String> list = ['Milhas', 'Quilômetros', 'Jarda'];

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new

    // ignore: unnecessary_new
    return new Scaffold(
        appBar: AppBar(
          title: Text("Conversor de Medida"),
        ),
        body: Consumer<CalculoController>(builder: (context, calculo, child) {
          return ListView(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                //child: ValorConvertido(25),
              ),
              SizedBox(height: 10),
              TextField(
                //controller: TextEditingController ( text: 1.toString() ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Insira o valor", label: Text("Valor")),
                onChanged: (_valorInicial) {
                  if (_valorInicial != "") {
                    calculo.input = double.parse(_valorInicial);
                    calculo.output = 2;
                  }
                },
              ),
              SizedBox(height: 20),
              Text("De"),
              SizedBox(height: 10),
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
              SizedBox(height: 10),
              Text("Para"),
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
              SizedBox(height: 85),
              Text(
                (calculo.input.toString()) +
                    ' ' +
                    (calculo.nomeFrom.toString()) +
                    ' são equivalentes á ' +
                    (calculo.output.toString()) +
                    " " +
                    (calculo.nomeTo.toString()),
                textAlign: TextAlign.center,
              ),
            ],
          );
        }));
  }
}

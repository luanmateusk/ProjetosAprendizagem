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
                            Align(
                              alignment: Alignment.topCenter,
                              //child: ValorConvertido(25),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              //controller: TextEditingController ( text: 1.toString() ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: "Insira o valor",
                                  label: Text("Valor")),
                              onChanged: (_valorInicial) {
                                if (_valorInicial != "") {
                                  //quando o valor inicial estiver preenchido executa...
                                  calculo.input = double.parse(_valorInicial);
                                   calculo.converter(calculo);
                                   
                                  //calculo.output = 2;
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
                            ElevatedButton(
                                onPressed: () {
                                  calculo.converter(calculo);

                                },
                                child: Text("Registrar conversão")),
                                
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Text(
                  (calculo.input.toString()) +
                      ' ' +
                      (calculo.nomeFrom.toString()) +
                      '\n são equivalentes á \n' +
                      (calculo.output.toString()) +
                      " " +
                      (calculo.nomeTo.toString()),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
                          Center(
                child: Image.asset('lib/assets/speedometter.png',
                    width: 250, height: 250),
              ),],
          );
        }));
  }
}

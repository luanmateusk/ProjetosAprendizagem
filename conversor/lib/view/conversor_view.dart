// ignore_for_file: deprecated_member_use
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../controller/conversao_controller.dart';

class ConversorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    String dropDownValue='One';
    // ignore: unnecessary_new
    return new Scaffold(
      appBar: AppBar(
        title: Text("Conversor de Medida"),
      ),
      body: ListView(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            //child: ValorConvertido(25),
          ),

          

          DropdownButton<String>(
            value: dropDownValue, 
            onChanged: (String? newValue) {
            
            setState(() {
          dropDownValue = newValue!;
        });
            );



          TextField(
            decoration: InputDecoration(
                hintText: "Insira o valor", label: Text("Valor Inicial")),
            onChanged: (_) {},
          ),
          RaisedButton(
            onPressed: () {},
            child: Text("Calcular"),
            
                      

            
          ),
        ],
      ),
    );
  }
}

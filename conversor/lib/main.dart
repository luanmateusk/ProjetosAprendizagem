/*
8 - Desenvolva um aplicativo capaz de converter as medidadas imperiais para medias métricas, com os seguintes requisitos:

 a - O aplicativo precisa ir salvando as conversões feitas pelo usuário em um log

 b - O aplicativo precisa ter uma tela separada para mostrar esse log

 c - O usuário pode ter a opção de remover o cálculo do log com o clique longo sobe o registro*/

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:conversor/view/conversor_view.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(AppConversor());
}

class AppConversor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Conversor3",
        home: ConversorView(),
      );
  } 
}

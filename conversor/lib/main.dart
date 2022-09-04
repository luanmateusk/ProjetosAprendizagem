/*
8 - Desenvolva um aplicativo capaz de converter as medidadas imperiais para medias métricas, com os seguintes requisitos:

 a - O aplicativo precisa ir salvando as conversões feitas pelo usuário em um log

 b - O aplicativo precisa ter uma tela separada para mostrar esse log

 c - O usuário pode ter a opção de remover o cálculo do log com o clique longo sobe o registro*/

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:conversor/controller/calculo_controller.dart';
import 'package:conversor/view/conversor_view.dart';
import 'package:conversor/view/log_view.dart';
import 'package:conversor/view/navigationBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => CalculoController()),
    ], child: AppConversor()),
  );
}

class AppConversor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Conversor de Medidas",
      home: ConversorView(),
      initialRoute: "/conversor",
      routes: {
        "/conversor": (context) => ConversorView(),
        "/log": (context) => LogConversoes(),
        "/navigation": (context) => MyStatefulWidget(),
      },
    );
  }
}

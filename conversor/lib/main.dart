/*
8 - Desenvolva um aplicativo capaz de converter as medidadas imperiais para medias métricas, com os seguintes requisitos:

 a - O aplicativo precisa ir salvando as conversões feitas pelo usuário em um log

 b - O aplicativo precisa ter uma tela separada para mostrar esse log

 c - O usuário pode ter a opção de remover o cálculo do log com o clique longo sobe o registro*/

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:conversor/controller/calculo_controller.dart';
import 'package:conversor/view/conversor_view.dart';
import 'package:conversor/view/historico_view.dart';
import 'package:conversor/view/grafico_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => CalculoController()),
    ], child: AppConversor()),
  );
}

class AppConversor extends StatefulWidget {
  const AppConversor({Key? key}) : super(key: key);

  @override
  State<AppConversor> createState() => _AppConversorState();
}

class _AppConversorState extends State<AppConversor> {
  int _opcaoSelecionada = 0;

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 102, 5, 5),
          fixedColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: _opcaoSelecionada,
          /**on tap é o responsavel por direcionar o index de cada tela acionada no navigation */
          onTap: (opcao) {
            print('Clicou $opcao');

            setState(() {
              _opcaoSelecionada = opcao;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: 'Conversor',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Histórico',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Gráficos',
            ),
          ],
        ),
        appBar: AppBar(
          title: Text('Conversor de Medida'),
          backgroundColor: Color.fromARGB(255, 102, 5, 5),
          
        ),
        /*IndexedStack onde define conforme opcao selecionada qual tela o body irá exibir*/ 
      body: IndexedStack(index: _opcaoSelecionada, children:<Widget> [
        ConversorView(),
        HistoricoView(),
        GraficoView(),
      ],),),
    );
  }
}






/*class AppConversor extends StatelessWidget {
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
}*/



import 'package:flutter/material.dart';

void main() {
  runApp(AppConversor());
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
          title: Text('Testando Navigation Bar'),
          backgroundColor: Color.fromARGB(255, 102, 5, 5),
          
        ),
        /*IndexedStack onde define conforme opcao selecionada qual tela o body irá exibir*/ 
      body: IndexedStack(index: _opcaoSelecionada, children:<Widget> [
        ConversorPage(),
        HistoricoPage(),
        GraficoPage(),
      ],),),
    );
  }
}

class ConversorPage extends StatelessWidget {
  const ConversorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Conversor')),
    );
  }
}

class HistoricoPage extends StatelessWidget {
  const HistoricoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Histórico')),
    );
  }
}

class GraficoPage extends StatelessWidget {
  const GraficoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Gráficos')),
    );
  }
}


import 'package:consumoapi/view/agendamentos.dart';
import 'package:consumoapi/view/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppServicos());
}

class AppServicos extends StatefulWidget {
  const AppServicos({Key? key}) : super(key: key);

  @override
  State<AppServicos> createState() => _AppServicosState();
}

class _AppServicosState extends State<AppServicos> {
  int _opcaoSelecionada = 0;

  Widget build(BuildContext context) {
    return MaterialApp(
         debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorSchemeSeed: Color.fromARGB(255, 66, 2, 2), useMaterial3: true),
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
              label: 'Novo Agendamento',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Agendamentos',
            ),

          ],
        ),
        appBar: AppBar(
          
          
          title: Text('Conversor de Medida'),
          backgroundColor: Color.fromARGB(255, 102, 5, 5),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
          

        ),
        /*IndexedStack onde define conforme opcao selecionada qual tela o body irá exibir*/
        body: IndexedStack(
          index: _opcaoSelecionada,
          children: <Widget>[
            //a ordenação deses define a sequência
            HomePage(),
            Agendamentos(),
            
       
          ],
        ),
      ),
    );
  }
}

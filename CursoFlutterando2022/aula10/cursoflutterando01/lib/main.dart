import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => Pessoa(nome: 'Luan', idade: 25),
    child: MyApp(),
  )
  );
}

class Pessoa with ChangeNotifier {
  String nome = 'João';
  int idade = 22;

  Pessoa({required this.nome, required this.idade});

  void incrementaIdade() {
    this.idade++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Meu primeiro App")),
      ),
      body: Center(
          child: Text((context).select((Pessoa p) => p.idade.toString()))),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<Pessoa>(context, listen: false).incrementaIdade();
          },
          // ignore: prefer_const_constructors
          child: Icon(Icons.add)),
    ));
  }
}

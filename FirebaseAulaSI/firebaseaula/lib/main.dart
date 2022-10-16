import 'package:flutter/material.dart';

class AppEventos extends StatelessWidget {
  const AppEventos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('Aplicativo de eventos')),
      body: Text("Bem vindo"),
    ));
  }
}

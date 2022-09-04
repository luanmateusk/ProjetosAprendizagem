import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogConversoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Olá mundo",
      home: Scaffold(
          appBar: AppBar(
        title: Text("Log de conversões"),
      )),
    );
  }
}

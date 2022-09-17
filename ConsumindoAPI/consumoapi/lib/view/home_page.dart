import 'dart:convert'; // o que converte de json para dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController txtcep = new TextEditingController();
  String? resultado;

  _consultaCep() async {
    String cep = txtcep.text; //get cep digitado no textfield
    String url = "https://viacep.com.br/ws/${cep}/json/";

    http.Response response;
    response = await http.get(Uri.parse(url));

    Map<String, dynamic> retorno = json.decode(response
        .body); //json decode conerte o corpo do json para o formato de map
    String logradouro = retorno["logradouro"];
    String localidade = retorno["localidade"];
    String bairro = retorno["bairro"];

    setState(() {
      resultado = "${logradouro} + ${localidade} + ${bairro}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Usuários")),
        body: Container(
            padding: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Digite o cep ex: 85913080"),
                  controller: txtcep,
                ),
                Text("Resultado: ${resultado}", style: TextStyle(fontSize: 25)),
                ElevatedButton(
                    onPressed: () {
                      _consultaCep();
                    },
                    child: Text("Consultar", style: TextStyle(fontSize: 25))),
              ],
            )));
  }
}

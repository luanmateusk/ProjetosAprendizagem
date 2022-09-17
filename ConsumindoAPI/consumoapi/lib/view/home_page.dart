import 'dart:convert'; // o que converte de json para dart
import 'package:consumoapi/models/agendamentos_model.dart';
import 'package:consumoapi/view/agendamentos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:consumoapi/models/cliente_model.dart';
import 'package:consumoapi/models/endereco_model.dart';

String? resultado;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController txtcep = new TextEditingController();
  TextEditingController txtNome = new TextEditingController();
  TextEditingController txtSobrenome = new TextEditingController();
  TextEditingController txtNumCasa = new TextEditingController();

  Cliente c = new Cliente("nome", "sobrenome");
  AgendamentosModel a = new AgendamentosModel();

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
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Nome"),
                  controller: txtNome,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Sobrenome"),
                  controller: txtSobrenome,
                ),
                TextField(
                  maxLength: 8,
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Digite o cep ex: 85913080"),
                  controller: txtcep,
                  onChanged: (txtcep) {
                    if (txtcep.length == 8) {
                      setState(() {
                        c.criaLocalizacao(txtcep.toString());
                      });
                    }
                  },
                ),
                TextField(
                  maxLength: 8,
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Digite o número da sua casa"),
                  controller: txtNumCasa,
                ),
                Text("Resultado: ${c.endereco.bairro}",
                    style: TextStyle(fontSize: 25)),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        c.criaLocalizacao(txtcep.toString());
                        c.nome = txtNome.text;
                        c.sobrenome = txtSobrenome.text;
                        c.endereco.numeroCasa = txtNumCasa.text;
                        a.adicionaAgendamento(c);
                      });
                    },
                    child: Text("Consultar", style: TextStyle(fontSize: 25))),
              ],
            )));
  }
}

// _consultaCep(String cepX) async {
//   String cep = cepX; //get cep digitado no textfield
//   String url = "https://viacep.com.br/ws/${cep}/json/";

//   http.Response response;
//   response = await http.get(Uri.parse(url));

//   Map<String, dynamic> retorno = json.decode(response
//       .body); //json decode conerte o corpo do json para o formato de map
//   String logradouro = retorno["logradouro"];
//   String localidade = retorno["localidade"];
//   String bairro = retorno["bairro"];

//   resultado = "${logradouro} + ${localidade} + ${bairro}";
// }

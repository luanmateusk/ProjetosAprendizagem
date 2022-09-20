// import 'dart:convert'; // o que converte de json para dart
// import 'package:consumoapi/models/agendamentos_model.dart';
// import 'package:consumoapi/view/agendamentos.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:consumoapi/models/agendamento_model.dart';
// import 'package:consumoapi/models/endereco_model.dart';

// String? resultado;

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   TextEditingController txtcep = new TextEditingController();
//   TextEditingController txtNome = new TextEditingController();
//   TextEditingController txtSobrenome = new TextEditingController();
//   TextEditingController txtNumCasa = new TextEditingController();

//   AgendamentosModel a = new AgendamentosModel();
//   Endereco end = new Endereco();

//   void consultaCep() async {
//     //get cep digitado no textfield
//     String url = "https://viacep.com.br/ws/${txtcep}/json/";
    
//     http.Response response;
//     response = await http.get(Uri.parse(url));

//     Map<String, dynamic> retorno = json.decode(response
//         .body); //json decode conerte o corpo do json para o formato de map
//     String logradouro = retorno["logradouro"];
//     String localidade = retorno["localidade"];
//     String bairro = retorno["bairro"];
//     resultado = "${logradouro} + ${localidade} + ${bairro}";

//     end.bairro = bairro;
//     end.logradouro = "Cascavel";
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text("Usuários")),
//         body: Container(
//             padding: EdgeInsets.all(40),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 TextField(
//                   keyboardType: TextInputType.text,
//                   decoration: InputDecoration(labelText: "Nome"),
//                   controller: txtNome,
//                 ),
//                 TextField(
//                   keyboardType: TextInputType.text,
//                   decoration: InputDecoration(labelText: "Sobrenome"),
//                   controller: txtSobrenome,
//                 ),
//                 TextField(
//                   maxLength: 8,
//                   keyboardType: TextInputType.number,
//                   decoration:
//                       InputDecoration(labelText: "Digite o cep ex: 85913080"),
//                   controller: txtcep,
//                   onChanged: (txtcep) {
//                     if (txtcep.length == 8) {
//                       setState(() {
//                         consultaCep();
//                       });
//                     }
//                   },
//                 ),
//                 TextField(
//                   maxLength: 8,
//                   keyboardType: TextInputType.number,
//                   decoration:
//                       InputDecoration(labelText: "Digite o número da sua casa"),
//                   controller: txtNumCasa,
//                 ),
//                 Text(
//                   "${resultado}",
//                   style: TextStyle(fontSize: 25),
//                 ),
//                 ElevatedButton(
//                     onPressed: () {
//                       //precisa colocar o new aqui, se não ele sobreescreve o mesmo agendamento
//                       // Agendamento c =new Agendamento("nome", "sobrenome", txtcep.text);

//                       Agendamento c =
//                           new Agendamento("nome", "sobrenome", "cepY");
                      
//                       c.nome = txtNome.text;
//                       c.sobrenome = txtSobrenome.text;
//                       c.endereco.bairro = end.bairro;
//                       c.endereco.numeroCasa = txtNumCasa.text;
//                       a.adicionaAgendamento(c);

//                       setState(() {});
//                     },
//                     child: Text("Consultar", style: TextStyle(fontSize: 25))),
//               ],
//             )));
//   }
// }

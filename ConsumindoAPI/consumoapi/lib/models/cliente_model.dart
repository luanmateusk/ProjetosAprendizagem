import 'package:consumoapi/models/endereco_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; //

class Cliente {
  int? id;
  String? nome;
  String? sobrenome;
  Endereco endereco = new Endereco();
  Map<String, String>? contato;

  Cliente(nome, sobrenome) {
    this.nome = nome;
    this.sobrenome = sobrenome;

  }

  void criaLocalizacao(String cepX) async {
    String cep = cepX; //get cep digitado no textfield
    String url = "https://viacep.com.br/ws/${cep}/json/";

    http.Response response;
    response = await http.get(Uri.parse(url));

    Map<String, dynamic> retorno = json.decode(response
        .body); //json decode conerte o corpo do json para o formato de map
    this.endereco?.logradouro = retorno["logradouro"];
    this.endereco?.localidade = retorno["localidade"];
    this.endereco?.bairro = retorno["bairro"];
  }

  get getId => this.id;

  set setId(id) => this.id = id;

  get getNome => this.nome;

  void setNome(nome) => this.nome = nome;

  get getSobrenome => this.sobrenome;

  set setSobrenome(sobrenome) => this.sobrenome = sobrenome;

  get getEndereco => this.endereco;

  set setEndereco(endereco) => this.endereco = endereco;

  get getContato => this.contato;

  set setContato(contato) => this.contato = contato;
}

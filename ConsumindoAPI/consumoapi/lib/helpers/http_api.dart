import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/cep_model.dart';

class ViaCepService {
  static Future<ResultCep> fetchCep({required String cep}) async {


  String url = "https://viacep.com.br/ws/${cep}/json/";
    
    http.Response response;
    response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      return ResultCep.fromJson(response.body);
    } else {
      throw Exception('Requisição inválida!');
    }
  }
}

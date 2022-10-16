// ignore_for_file: deprecated_member_use

import 'package:consumoapi/models/agendamento_model.dart';
import 'package:consumoapi/models/agendamentos_model.dart';
import 'package:consumoapi/models/cep_model.dart';
import 'package:flutter/material.dart';
import '../helpers/http_api.dart';

DateTime? dataAgendamento;
TimeOfDay? horarioAgendamento;
TextEditingController txtcep = new TextEditingController();
TextEditingController txtNome = new TextEditingController();
TextEditingController txtSobrenome = new TextEditingController();
TextEditingController txtNumCasa = new TextEditingController();

class BuscaCep extends StatefulWidget {
  @override
  _BuscaCepState createState() => _BuscaCepState();
}

class _BuscaCepState extends State<BuscaCep> {
  var _searchCepController = TextEditingController();
  bool _loading = false;
  bool _enableField = true;
  String? _result;

  @override
  void dispose() {
    super.dispose();
    _searchCepController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _txtNomeCliente(),
            _txtSobrenomeCliente(),
            _txtCep(),
            _numeroCasa(),
            _dataAgendamento(),
            _horaAgendamento(),
            _botaoAgendar(),

            //_retornoCepJson(),
          ],
        ),
      ),
    );
  }

  Widget _txtNomeCliente() {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: "Nome"),
      controller: txtNome,
    );
  }

  Widget _txtSobrenomeCliente() {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: "Sobrenome"),
      controller: txtSobrenome,
    );
  }

  Widget _txtCep() {
    return TextField(
      autofocus: true,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(labelText: 'CEP'),
      controller: _searchCepController,
      enabled: _enableField,
    );
  }

  Widget _botaoAgendar() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: RaisedButton(
        onPressed: _procurarCEP,
        child: _loading ? _circularLoading() : Text('Realizar Agendamento'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget _horaAgendamento() {
    return ElevatedButton(
        child: Text((horarioAgendamento == null)
            ? 'Inserir hora'
            : '${horarioAgendamento?.hour}:${horarioAgendamento?.minute}'),
        onPressed: () async {
          TimeOfDay? _hora = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );
          if (_hora != null) {
             setState(() {horarioAgendamento = _hora;});
          }
         
        });
  }

  Widget _dataAgendamento() {
    return ElevatedButton(
        child: Text((dataAgendamento == null)
            ? "Inserir data"
            : '${dataAgendamento?.day}/${dataAgendamento?.month}/${dataAgendamento?.year}'),
        onPressed: () async {
          DateTime? dia = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
          );
          if (dia != null) {
            dataAgendamento = dia;
          }
          setState(() {});
        });
  }

  Widget _numeroCasa() {
    return TextField(
      maxLength: 8,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: "Digite o número da sua casa"),
      controller: txtNumCasa,
    );
  }

    Widget _retornoCepJson() {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Text(_result ?? ''),
    );
  }



// Gera loop de progresso enquanto é realizado a integração com a API
  Widget _circularLoading() {
    return Container(
      height: 15.0,
      width: 15.0,
      child: CircularProgressIndicator(),
    );
  }

// é acionado pelo botão Realizar agendamento, esse método realiza a integração com a API
  Future _procurarCEP() async {
    _procurando(true);

    final cep = _searchCepController.text;

    final resultCep = await IntegraCEP.retornaCEP(cep: cep);
    print(resultCep.localidade); // Exibindo somente a localidade no terminal

    //19/09/2022

    Agendamento a = new Agendamento(txtNome.text, txtSobrenome.text, "");
    AgendamentosModel ag = new AgendamentosModel();
    a.endereco.bairro = resultCep.bairro;
    a.endereco.cep = resultCep.cep;
    a.endereco.logradouro = resultCep.logradouro;
    a.endereco.localidade = resultCep.localidade;
    a.endereco.uf = resultCep.uf;
    a.endereco.numeroCasa = txtNumCasa.text;
    a.diaAgendamento = dataAgendamento;
    a.horaAgendamento = horarioAgendamento;
    ag.adicionaAgendamento(a);

    setState(() {
      _result = resultCep.toJson();
    });

    _procurando(false);
  }


    /*quando o botão Realizar agendamento é acionado, esse método é chamado
    e todas ativando os parametros de controle 
    ,
    loading - variavel bool utilizado para ativiar loop visual controller botão 
    enable Field - variavel bool usado para desabilitar o campo txtCEP, no/
    result-  utilizado variavel bool para retorno do json se for exibido na homepg*/
    void _procurando(bool enable) {
    setState(() {
      _result = enable ? '' : _result;
      _loading = enable;
      _enableField = !enable;
    });
  }


}

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
            _buildSearchCepTextField(),
            TextField(
              maxLength: 8,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: "Digite o número da sua casa"),
              controller: txtNumCasa,
            ),
            ElevatedButton(
                child: Text("Data do Chamado"),
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
                }),
            Text(
              (dataAgendamento == null)
                  ? 'O chamado não tem data'
                  : '${dataAgendamento?.day}-${dataAgendamento?.month}-${dataAgendamento?.year}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w200,
              ),
            ),
            ElevatedButton(
                child: Text("Hora da Chamado"),
                onPressed: () async {
                  TimeOfDay? _hora = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (_hora != null) {
                    horarioAgendamento = _hora;
                  }
                  setState(() {});
                }),
            Text(
              (horarioAgendamento == null)
                  ? 'O chamado não tem hora'
                  : '${horarioAgendamento?.hour}:${horarioAgendamento?.minute}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w200,
              ),
            ),
            _buildSearchCepButton(),
            _buildResultForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchCepTextField() {
    return TextField(
      autofocus: true,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(labelText: 'Cep'),
      controller: _searchCepController,
      enabled: _enableField,
    );
  }

  Widget _buildSearchCepButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: RaisedButton(
        onPressed: _searchCep,
        child: _loading ? _circularLoading() : Text('Realizar Agendamento'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  void _searching(bool enable) {
    setState(() {
      _result = enable ? '' : _result;
      _loading = enable;
      _enableField = !enable;
    });
  }

  Widget _circularLoading() {
    return Container(
      height: 15.0,
      width: 15.0,
      child: CircularProgressIndicator(),
    );
  }

  Future _searchCep() async {
    _searching(true);

    final cep = _searchCepController.text;

    final resultCep = await ViaCepService.fetchCep(cep: cep);
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

    _searching(false);
  }

  Widget _buildResultForm() {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Text(_result ?? ''),
    );
  }
}

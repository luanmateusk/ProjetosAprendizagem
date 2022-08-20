/*Aula002
https://ember-feeling-d46.notion.site/Aula-2-03-08-2022-800449aaa0fa4a85b40871e2e5ba2d9e
*/ 

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:conversor/models/chamado.dart';
import 'package:conversor/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'models/chamado.dart';

void main() {
  runApp(AppChamados());
}

class AppChamados extends StatefulWidget {
  @override
  AppChamadosState createState() => AppChamadosState();
}

class AppChamadosState extends State<AppChamados> {
  late Chamado chamado;
  late List<Chamado> chamados;

  List<String> tipo = ['Concerto', 'Manutenção', 'Instalação'];

  List<String> materiais = ['Notebook', 'HD', 'Crimpador', 'Multímetro'];
  Map<String, bool> materiaisSelecionados = {
    'Notebook': false,
    'HD': false,
    'Crimpador': false,
    'Multímetro': false,
  };

  late String listaMateriaisSelecionados;

  @override
  void initState() {
    listaMateriaisSelecionados = "";
    chamado = Chamado();
    chamados = <Chamado>[];
    super.initState();
  }

  void _refreshStateBasics({
    String? nome,
    String? descricao,
    DateTime? dia,
    TimeOfDay? hora,
    double? duracao,
    String? tipo,
    bool importante = false,
  }) {
    chamado.nome = nome != null ? nome : chamado.nome;
    chamado.descricao = descricao != null ? descricao : chamado.descricao;
    chamado.dia = dia != null ? dia : chamado.dia;
    chamado.hora = hora != null ? hora : chamado.hora;
    chamado.duracao = duracao != null ? duracao : chamado.duracao;
    chamado.tipo = tipo != null ? tipo : chamado.tipo;
    chamado.importante = importante;

    setState(() {
      chamado = chamado;
    });
  }

  void _refreshStateMaterais(String material, bool selecionado) {
    materiaisSelecionados[material] = selecionado;
    setState(() {
      // chamado = chamado;
      materiaisSelecionados = materiaisSelecionados;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chamados",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Chamados"),
        ),
        body: Builder(builder: (context) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomTexField(
                      hintText: "Insira o nome do chamado",
                      label: "Nome",
                      onChanged: (value) {
                        _refreshStateBasics(nome: value);
                      }),
                  CustomTexField(
                      hintText: "Insira a descrição do chamado",
                      label: "Descrição",
                      lines: 3,
                      onChanged: (value) {
                        _refreshStateBasics(descricao: value);
                      }),

                  Text(
                    "Horários",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          child: Text("Data do Chamado"),
                          onPressed: () async {
                            DateTime? dia = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                            );
                            if (dia != null) {
                              _refreshStateBasics(dia: dia);
                            }
                          }),
                    ),
                    Text(
                      (chamado.dia == null)
                          ? 'O chamado não tem data'
                          : '${chamado.dia?.day}-${chamado.dia?.month}-${chamado.dia?.year}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ]),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            child: Text("Hora da Chamado"),
                            onPressed: () async {
                              TimeOfDay? hora = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (hora != null) {
                                _refreshStateBasics(hora: hora);
                              }
                            }),
                      ),
                      Text(
                        (chamado.hora == null)
                            ? 'O chamado não tem hora'
                            : '${chamado.hora?.hour}:${chamado.hora?.minute}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Column(
                          children: [
                            Text(
                              "Materiais",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: materiais.length,
                              itemBuilder: (context, index) {
                                String _material = materiais[index];
                                bool? _selecionado =
                                    materiaisSelecionados[_material];
                                return Row(
                                  children: [
                                    Checkbox(
                                      value: _selecionado,
                                      onChanged: (value) {
                                        _refreshStateMaterais(
                                            _material, value!);
                                        listarMateriaisSelecionados();
                                      },
                                    ),
                                    Text(_material)
                                  ],
                                );
                              },
                            ),
                            Text(
                              (listaMateriaisSelecionados == "")
                                  ? 'Nenhum selecionado'
                                  : '$listaMateriaisSelecionados',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        // alignment: AlignmentDirectional.topStart,
                        child: Column(
                          children: [
                            Text(
                              "Tipo",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30),
                              child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: chamado.tipo,
                                  items: tipo.map((e) {
                                    return DropdownMenuItem<String>(
                                      child: Text(e),
                                      value: e,
                                    );
                                  }).toList(),
                                  onChanged: (tipo) {
                                    _refreshStateBasics(tipo: tipo);
                                  }),
                            ),
                            Row(children: [
                              Text("Importante: "),
                              Switch(
                                  value: chamado.importante,
                                  onChanged: (importante) {
                                    _refreshStateBasics(importante: importante);
                                  }),
                            ]),
                            Row(
                              children: [
                                Text("Duração: "),
                                Container(
                                  width: 90,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (duracao) {
                                      double? _duracao =
                                          double.tryParse(duracao);
                                      if (_duracao != null) {
                                        _refreshStateBasics(duracao: _duracao);
                                      }
                                    },
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  ElevatedButton(
                      child: Text("Cadastrar"), onPressed: cadastrar),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Divider(),
                        Text(
                            ' Total de ${chamados.length} chamados cadastrados'),
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: chamados.length,
                          itemBuilder: (context, index) {
                            Chamado _chamado = chamados.elementAt(index);
                            return Card(
                              // child: Text(_chamado.nome.toString()),
                              child: Column(
                                children: [
                                  Text(_chamado.nome.toString()),
                                  Text(_chamado.materiais.toString()),
                                ],
                              ),
                              // child: Text('elemento $index'),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  void listarMateriaisSelecionados() {
    String _listaMateriaisSelecionados = "";
    materiaisSelecionados.forEach((key, value) {
      if (value) {
        _listaMateriaisSelecionados = _listaMateriaisSelecionados + key + " - ";
      }
    });
    setState(() {
      listaMateriaisSelecionados = _listaMateriaisSelecionados;
    });
  }

  void cadastrar() {
    listarMateriaisSelecionados();
    // cria a lista de materiais que foram selecionados
    // List<String>_materiais = <String>['Notebook', 'outro'];
    materiaisSelecionados.forEach((key, value) {
      if (value) {
        chamado.materiais.add(key.toString());
      }
    });

    // chamado.materiais.add('listaMateriaisSelecionados');

    chamados.add(chamado);
    setState(() {
      chamados = chamados;
      chamado = Chamado();
    });
  }
}

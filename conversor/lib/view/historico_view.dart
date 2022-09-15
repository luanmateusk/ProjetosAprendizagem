import 'package:conversor/controller/historico_controller.dart';
import 'package:conversor/models/historico_model.dart';
import 'package:conversor/view/conversor_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

bool exibeBotaoClear = false;
int _selectedIndex = 0;
String logString = '';

class Log extends StatefulWidget {
  const Log({Key? key}) : super(key: key);

  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: Color.fromARGB(255, 66, 2, 2), useMaterial3: true),
      debugShowCheckedModeBanner: false,
      title: 'Conversor de medidas',
      home: Scaffold(
        body: Column(
          children: [
            Consumer<HistoricoController>(builder: (context, log, child) {
              return Column(
                children: [
                  Center(),
                  SingleChildScrollView(
                    child: Column(
                      children: log.getSalvaLog.valoresLog!.map((calculo) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Material(
                              color: Colors.red[100],
                              child: ListTile(
                                title: Text(calculo.toString()),
                                //subtitle: Text("Consertar"),
                              )),
                        );
                      }).toList(),
                    ),
                  ),
                  Text("Exibindo " + log.getSalvaLog.qtdItens.toString()+ " registro(s)"),
                  Visibility(
                    visible: log.historicoX.existeItens,
                    child: ElevatedButton(
                      onPressed: () {
                        log.limpaLog();
                        log.historicoX.existeItens = false;
                        log.limpaLog();
                      },
                      child: const Text(
                        'Apagar todos os registros',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:conversor/models/calculo_model.dart';
import 'package:conversor/controller/calculo_controller.dart';

const List<String> list = <String>['Milhas', 'Quilômetros', 'Jarda'];


class DropdownButtonApp extends StatelessWidget {
  const DropdownButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Lista de Unidades de Medidas')),
        body: const Center(
          child: DropdownButtonMedidas(),
        ),
      ),
    );
  }
}

class DropdownButtonMedidas extends StatefulWidget {
  const DropdownButtonMedidas({super.key});

  @override
  State<DropdownButtonMedidas> createState() => _DropdownButtonMedidas();
}

class _DropdownButtonMedidas extends State<DropdownButtonMedidas> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;

        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
*/
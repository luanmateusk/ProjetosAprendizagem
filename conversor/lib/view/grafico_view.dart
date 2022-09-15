import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:pie_chart/pie_chart.dart';

Map<String, double> dataMap = {
  "Valor inicial": 0,
};

final valorItemChart = TextEditingController();
final legendaItemChart = TextEditingController();

class GraficoView extends StatefulWidget {
  const GraficoView({Key? key}) : super(key: key);

  @override
  State<GraficoView> createState() => _GraficoViewState();
}

class _GraficoViewState extends State<GraficoView> {
  List<Color> colorList = [
    const Color(0xffD95AF3),
    const Color(0xff3EE094),
    const Color(0xff3398F6),
    const Color(0xffFA4A42),
    const Color(0xffFE9539)
  ];

  final gradientList = <List<Color>>[
    [
      Color.fromRGBO(223, 250, 92, 1),
      Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      Color.fromRGBO(129, 182, 205, 1),
      Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      Color.fromRGBO(175, 63, 62, 1.0),
      Color.fromRGBO(254, 154, 92, 1),
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
// ignore: prefer_const_constructors
            TextField(
              controller: valorItemChart,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(label: Text("Valor")),
            ),

            TextField(
              controller: legendaItemChart,
              //keyboardType: TextInputType.number,
              decoration: InputDecoration(label: Text("Legenda")),
            ),

            ElevatedButton(
                onPressed: () {
                  if ((legendaItemChart.text.isNotEmpty ?? true) &&
                      (valorItemChart.text.isNotEmpty ?? true)) {
                    //se a soma dos itens da lista for igual ou menor que 0, ela limpa a lista para adicionar os novos valores
                    var values = dataMap.values;
                    var result = values.reduce((sum, element) => sum + element);
                    if (result <= 0) {
                      dataMap.clear();
                    }

                    setState(() {
                      addNewMap(legendaItemChart.text,
                          double.parse(valorItemChart.text));

                      valorItemChart.clear();
                      legendaItemChart.clear();
                    });
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text the that user has entered by using the
                          // TextEditingController.
                          content: Text("Preencher campos de valor e legenda"),
                        );
                      },
                    );
                  }
                },
                child: Text("Incluir no gráfico")),

            SizedBox(height: 30),

            Center(
              child: PieChart(
                dataMap: dataMap,
                colorList: colorList,
                chartRadius: MediaQuery.of(context).size.width / 2,
                //centerText: "",
                ringStrokeWidth: 20,
                animationDuration: const Duration(seconds: 3),
                chartValuesOptions: const ChartValuesOptions(
                    showChartValues: true,
                    showChartValuesOutside: true,
                    showChartValuesInPercentage: true,
                    showChartValueBackground: false),
                // legendOptions: const LegendOptions(
                //     showLegends: true,
                //     legendShape: BoxShape.rectangle,
                //     legendTextStyle: TextStyle(fontSize: 15),

                //     //legendPosition: LegendPosition.bottom,
                //     showLegendsInRow: true),
                gradientList: gradientList,
              ),
            ),
            // Generated code for this ListTile Widget...
            // Container(
            //   child: ListTile(
            //     title: Text(
            //       'Lorem ipsum dolor...',
            //     ),
            //     subtitle: Text(
            //       'Lorem ipsum dolor...',
            //     ),
            //     trailing: Icon(
            //       Icons.arrow_forward_ios,
            //       color: Color(0xFF303030),
            //       size: 20,
            //     ),
            //     tileColor: Color(0xFFF5F5F5),
            //     dense: false,
            //   ),
            // ),

// Container(

//         child: SingleChildScrollView(

//           padding: const EdgeInsets.fromLTRB(1, 50, 1, 1),
//           child: Column(

//             children:
//               // ignore: unnecessary_new
//               dataMap.entries.map( (entry) => new ListTile(

//                 //style:
//                 contentPadding: const EdgeInsets.all(5.0),
//                 leading: Icon(Icons.add_chart),
//                 title: Text(entry.key),
//                 subtitle: Text(entry.value.toString()),
//                 tileColor: Color.fromARGB(255, 102, 5, 5),
//                 textColor: Colors.white,
//                 trailing: Icon(Icons.more_vert),
//                 onTap: () {                     showDialog(
//                       context: context,
//                       builder: (context) {
//                         return AlertDialog(
//                           // Retrieve the text the that user has entered by using the
//                           // TextEditingController.
//                           content: Text(entry.key + ":"+entry.value.toString()),
//                         );
//                       },
//                     );}

//                 //trailing: Text(entry.value.toString()),
//               )).toList()
//            ),
//         )
//     )

        
         
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            dataMap.clear();
            addNewMap("Valor Inicial", 0);
          });
        },
        label: const Text('Limpar Gráfico'),
        icon: const Icon(Icons.clear),
        //backgroundColor: Colors.pink,
      ),
    );
  }
}

void addNewMap(String valueS, double ValueD) {
  dataMap.addAll({valueS: ValueD});
}

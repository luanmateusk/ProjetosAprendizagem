import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pra que serve ?',
      home: Scaffold(
          appBar: AppBar(title: Text("Hello World")),
          body: Center(
            child: Row(
              children: [Text("texto"), Text("texto2"), Text("texto3")],
            ),
          )),
    );
  }
}

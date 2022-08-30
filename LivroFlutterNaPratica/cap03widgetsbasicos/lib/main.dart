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
          child: Column(
          
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(textAlign: TextAlign.center,maxLength: 2,cursorColor: Colors.red),
              ElevatedButton(onPressed: null, child: Text("OK"))
              ],

              
          ),
        ),
      ),
    );
  }
}

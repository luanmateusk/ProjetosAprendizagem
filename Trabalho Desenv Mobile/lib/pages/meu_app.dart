
import 'package:flutter/material.dart';
import 'package:trabalhoDevMobile/pages/home_page.dart';

class MeuApp extends StatelessWidget {
  const MeuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'Trabalho',
      debugShowCheckedModeBanner: false,
            theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomePage(),
    );
  }
}

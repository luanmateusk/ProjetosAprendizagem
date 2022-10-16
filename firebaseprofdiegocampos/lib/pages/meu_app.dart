import 'package:firebaseprofdiegocampos/pages/home_page.dart';
import 'package:firebaseprofdiegocampos/pages/login_page.dart';
import 'package:firebaseprofdiegocampos/pages/reset_page.dart';
import 'package:firebaseprofdiegocampos/widgets/auth_check.dart';
import 'package:flutter/material.dart';

class MeuApp extends StatelessWidget {
  const MeuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'iAgenda',
      debugShowCheckedModeBanner: false,
            theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const AuthCheck(),
    );
  }
}

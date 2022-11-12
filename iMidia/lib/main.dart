import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseprofdiegocampos/pages/meu_app.dart';
import 'package:firebaseprofdiegocampos/services/auth_service.dart';
import 'package:firebaseprofdiegocampos/widgets/auth_check.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


 main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); //inicializaçõa dos módulos do firebase

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AuthService()),
  ],
  child: MeuApp(),
  ));
}


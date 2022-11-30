import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalhoDevMobile/pages/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
    ),
  );
}

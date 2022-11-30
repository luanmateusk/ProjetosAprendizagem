import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'camera_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("iMidia"),
        elevation: .1,
        backgroundColor: Color.fromRGBO(94, 33, 40, 1.0),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItem("Câmera", Icons.camera),
            makeDashboardItem("Áudio", Icons.voice_over_off),
          ],
        ),
      ),
    );
  }

  Card makeDashboardItem(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          // ignore: unnecessary_new
          child: new InkWell(
            onTap: () {
              switch (title) {


                case "Câmera":
                  {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CameraPage()));
                  }
                  break;

                case "Áudio":
                  {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AudioComponent(File('abc'))));
                  }
                  break;

                case "Câmera":
                  {}
                  break;

                default:
                  {}
                  break;
              }
              ;
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: Colors.black,
                )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }
}

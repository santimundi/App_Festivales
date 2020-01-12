//import 'package:festival/escenario/stages.dart';
import 'package:flutter/material.dart';
//import 'package:festival/grupo/infoGroup.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text('Tareas'),),
      ),
    );
  }
}
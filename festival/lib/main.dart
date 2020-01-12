<<<<<<< HEAD
//import 'package:festival/escenario/stages.dart';
=======
import 'package:festival/concierto/concerts.dart';
import 'package:festival/concierto/concierto.dart';
import 'package:festival/escenario/stages.dart';
>>>>>>> c34232149c8924941ce373efcdc210f117a443ed
import 'package:flutter/material.dart';
//import 'package:festival/grupo/infoGroup.dart';

void main(){
<<<<<<< HEAD
  runApp(MyApp());
=======
  runApp(Conciertos());
>>>>>>> c34232149c8924941ce373efcdc210f117a443ed
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
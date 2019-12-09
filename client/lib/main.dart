import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:client/MainPage.dart';
import 'package:client/Notifications.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final db= Firestore.instance;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue,),

      routes: {
        '/': (context) => MainPage(),
        '/Notifications': (context) => Notifications(),
      },

      home: Scaffold(
        body: FutureBuilder(
          future: db.collection('todos').getDocuments(),
          
        )
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:festival/mainpage/mainpage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Festival',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Mainpage(),
    );
  }
}
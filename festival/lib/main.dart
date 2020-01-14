import 'package:festival/calendario/calendario.dart';
import 'package:festival/dia/day.dart';
import 'package:festival/dia/dia.dart';
import 'package:festival/concierto/concerts.dart';
import 'package:festival/concierto/concierto.dart';
import 'package:festival/dataservice.dart' as db;
import 'package:festival/grupo/infoGroup.dart';
import 'package:festival/mainPage/mainpage.dart';
import 'package:festival/mainPage/mainpagesinappbar.dart';
import 'package:festival/merchandising/merchandising.dart';
import 'package:festival/notificaciones/notifications.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(RutasApp());
}

/*
void main(){
  runApp(InfoGroup(grupConcert: linkinparkconcierto));
}*/

class RutasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      routes: {
        '/mainPage': (context) => Mainpage(),
        '/calendar': (context) => Calendario(),
        '/days': (context) => Dias(),
        '/merchandising': (context) => Merch(),
        '/notifications': (context) => Notifications(),
       },
      initialRoute: '/mainPage',
    );
  }
}

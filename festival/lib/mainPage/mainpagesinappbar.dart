import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MainPage());


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
   @override
   Widget build(BuildContext context){
     return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color.fromRGBO(243, 156, 18, 1),
          child: ListView(
            children: <Widget>[
              Iconos(),
              SizedBox(height: 25,),
              Reloj(),
              Noticias(),
            ],
          )
        ),
      ),
    );
  }
}

class Iconos extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, right: 20, left:20, bottom: 25),
      decoration: BoxDecoration(
        color: Color.fromRGBO(249, 231, 159, 0.75),
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 25,),
          Expanded(
            child: Text(
              'News', 
              style: TextStyle( 
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Icon(
            Icons.notifications,
            color: Colors.black,
            size: 35,
          ),
        ],
      ),
    );
  }
}

class Reloj extends StatefulWidget {
  @override
  _RelojState createState() => _RelojState();
}

class _RelojState extends State<Reloj> {

  var dateFest = new DateTime.utc(2020, 8, 20, 20, 20);
  DateTime _now;

  _daysTime(DateTime _now){
    Duration difference = dateFest.difference(DateTime.now());
    //Duration difference = dateFest.difference(_now);
    return "${difference.inDays}";
  }

  _hoursTime(DateTime _now){
    Duration difference = dateFest.difference(DateTime.now());
    //Duration difference = dateFest.difference(_now);
    return "${difference.inHours - difference.inDays*24 - 1}";
  }

  _minutesTime(_now){
    Duration difference = dateFest.difference(DateTime.now());
    //Duration difference = dateFest.difference(_now);
    return "${difference.inMinutes - (difference.inHours*60 - 1)}";
  }

  final textStyledate = TextStyle(
    color: Colors.white,
    fontSize: 35,
    fontWeight: FontWeight.bold,
  );

  final textStylevar = TextStyle(
    color: Colors.white,
    fontSize: 20,
  );

  @override
  void initState(){
    super.initState();
    Timer.periodic(Duration(seconds: 1), (v){
      setState(() {
        _now = DateTime.now();
      });
    });
    //_now = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Material(
              elevation: 10.0,
              color: Color.fromRGBO(28, 40, 51, 1),
              child: Container(
                width: 270,
                height: 150,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Table(
                      children: [
                        TableRow(children: [
                          Text(_daysTime(_now), style: textStyledate,),
                          Text(_hoursTime(_now), style: textStyledate,),
                          Text(_minutesTime(_now), style: textStyledate,),
                        ]),
                        TableRow(children: [
                          Text("Days", style: textStylevar),
                          Text("Hours", style: textStylevar),
                          Text("Min.", style: textStylevar),
                        ]),
                      ],
                    ),
                  ),
                ),  
              ),
            )
          ],  
        ),
      ),
    );
  }
}

class Noticias extends StatelessWidget {

    final List<String> newsnews = [
    'Red',
    'Blue',
    'Green',
    'Purple',
    'Black',
    ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color.fromRGBO(249, 231, 159, 0.75),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.all(8),
          child: Text(
              newsnews.join('\n'),
              textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
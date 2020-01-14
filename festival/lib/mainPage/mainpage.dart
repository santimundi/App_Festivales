import 'package:festival/calendario/calendario.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Mainpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'News',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color.fromRGBO(243, 156, 18, 1),
          centerTitle: true,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () => Navigator.pop(context, false),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              onPressed: () =>
                  Navigator.of(context).pushNamed('/notifications'),
            )
          ],
        ),
        body: Container(
            color: Color.fromRGBO(243, 156, 18, 1),
            child: Column(
              children: <Widget>[
                Reloj(),
                Noticias(),
              ],
            )),
        bottomNavigationBar: BottomAppBar(
          color: Color.fromRGBO(243, 156, 18, 1),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: IconButton(
                  iconSize: 32.0,
                  icon: Icon(Icons.home),
                  onPressed: () => Navigator.of(context).pushNamed('/mainPage'),
                ),
              ),
              IconButton(
                icon: Icon(Icons.calendar_today),
                iconSize: 26.0,
                onPressed: () => Navigator.of(context).pushNamed('/calendar'),
              ),
              IconButton(
                icon: Icon(Icons.music_note),
                iconSize: 29.0,
                onPressed: () => Navigator.of(context).pushNamed('/days'),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  iconSize: 28.0,
                  onPressed: () => Navigator.of(context).pushNamed('/merchandising'),
                ),
              ),
            ],
          ),
        ),
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

  _daysTime(DateTime _now) {
    Duration difference = dateFest.difference(DateTime.now());
    //Duration difference = dateFest.difference(_now);
    return "${difference.inDays}";
  }

  _hoursTime(DateTime _now) {
    Duration difference = dateFest.difference(DateTime.now());
    //Duration difference = dateFest.difference(_now);
    return "${difference.inHours - difference.inDays * 24 - 1}";
  }

  _minutesTime(_now) {
    Duration difference = dateFest.difference(DateTime.now());
    //Duration difference = dateFest.difference(_now);
    return "${difference.inMinutes - (difference.inHours * 60 - 1)}";
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
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (v) {
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
                          Text(
                            _daysTime(_now),
                            style: textStyledate,
                          ),
                          Text(
                            _hoursTime(_now),
                            style: textStyledate,
                          ),
                          Text(
                            _minutesTime(_now),
                            style: textStyledate,
                          ),
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
    'Gren',
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

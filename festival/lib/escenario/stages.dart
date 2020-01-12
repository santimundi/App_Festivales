import 'package:festival/concierto/concierto.dart';
import 'package:festival/grupo/grupo.dart';
import 'package:flutter/material.dart';
import 'escenario.dart';

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
          Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 35,
          ),
          Expanded(
            child: Text(
              'Groups', 
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

class Dia extends StatefulWidget {
  @override
  _DiaState createState() => _DiaState();
}

class _DiaState extends State<Dia> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(255, 255, 102, 0.9),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_left,
              size: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:55.0, right: 10),
            child: Text(
                "Hola",
                //blue.conciertosStage[1].dia,
                style: TextStyle(fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 40),
            child: Icon(
              Icons.arrow_right,
              size: 50,
            ),
          )
        ],
      ),
    );
  }
}

class ListadoConciertos extends StatelessWidget {
  final List<Stage> escenarios = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(255, 255, 102, 0.9),
      height: 100,
      child: Row(
        children: <Widget>[      
          CartaConcierto(escenarios[0].conciertosStage[0],),
          CartaConcierto(escenarios[0].conciertosStage[1]),
        ],
      ),
    );
  }
}

class CartaConcierto extends StatelessWidget {
  final Concierto concert;
  final Grupo group = linkinparkgrupo;
  CartaConcierto(this.concert);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Wrap(
        children: <Widget>[
          Image.network(concert.imagenGrupo),
          ListTile(
            title: Text(group.nombreGrupo),
          ),
        ],
      ),
    );
  }
}

class Stages extends StatefulWidget {
  @override
  _StagesState createState() => _StagesState();
}

class _StagesState extends State<Stages> {
   @override
   Widget build(BuildContext context){
     return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color.fromRGBO(243, 156, 18, 1),
          child: Column(
            children: <Widget>[
              Iconos(),
              Dia(),
              SizedBox(height: 10,),
              ListadoConciertos(),
            ],
          )
        ),
      ),
    );
  }
}
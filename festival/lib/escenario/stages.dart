import 'package:festival/concierto/concierto.dart';
import 'package:flutter/material.dart';
import 'escenario.dart';

class Iconos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Groups',
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
              Iconos(),
              Dia(),
              SizedBox(
                height: 10,
              ),
              ListadoConciertos(),
            ],
          ),
        ),
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
                onPressed: () => Navigator.of(context).pushNamed('/stages'),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  iconSize: 28.0,
                  onPressed: () =>
                      Navigator.of(context).pushNamed('/merchandising'),
                ),
              ),
            ],
          ),
        ),
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
            padding: const EdgeInsets.only(left: 55.0, right: 10),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed("/concert");
            },
            child: Text(
              "STAGE 1",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                onLongPress: () {
                  Navigator.of(context).pushNamed("/concert");
                },
                child: CartaConcierto(
                  escenarios[0].conciertosStage[0],
                ),
              ),
              GestureDetector(
                onLongPress: () {
                  Navigator.of(context).pushNamed("/concert");
                },
                child: CartaConcierto(
                  escenarios[0].conciertosStage[1],
                ),
              ),
              //CartaConcierto(escenarios[0].conciertosStage[1]),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed("/concert");
            },
            child: Text(
              "STAGE 2",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                onLongPress: () {
                  Navigator.of(context).pushNamed("/concert");
                },
                child: CartaConcierto(
                  escenarios[1].conciertosStage[0],
                ),
              ),
              GestureDetector(
                onLongPress: () {
                  Navigator.of(context).pushNamed("/concert");
                },
                child: CartaConcierto(
                  escenarios[1].conciertosStage[1],
                ),
              ),
              //CartaConcierto(escenarios[0].conciertosStage[1]),
            ],
          ),
        ],
      ),
    );
  }
}

class CartaConcierto extends StatelessWidget {
  final Concierto concert;
  CartaConcierto(this.concert);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Wrap(
        children: <Widget>[
          Image.network(concert.imagenGrupo),
          ListTile(
            title: Text(concert.nombreGrupo),
          ),
        ],
      ),
    );
  }
}
/*
class Stages extends StatefulWidget {
  @override
  _StagesState createState() => _StagesState();
}

class _StagesState extends State<Stages> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            color: Color.fromRGBO(243, 156, 18, 1),
            child: Column(
              children: <Widget>[
                Iconos(),
                Dia(),
                SizedBox(
                  height: 10,
                ),
                ListadoConciertos(),
              ],
            )),
      ),
    );
  }
}
*/
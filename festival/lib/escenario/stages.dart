import 'package:festival/concierto/concierto.dart';
import 'package:festival/concierto/concerts.dart';
import 'package:festival/dia/dia.dart';
import 'package:festival/mainPage/mainpagesinappbar.dart';
import 'package:flutter/material.dart';
import 'escenario.dart';
import 'package:festival/dataservice.dart' as db;

class BotonesArriba extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Escenarios',
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
          onPressed: () => Navigator.of(context).pushNamed('/notifications'),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class BotonesBajo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
    );
  }
}

class Stages extends StatefulWidget {
  final String numPag, nomDia;
  Stages({Key key, this.numPag, this.nomDia}) : super(key: key);
  @override
  _StagesState createState() => _StagesState();
}

class _StagesState extends State<Stages> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: BotonesArriba(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            DiaConcierto(dia: widget.nomDia),
            StreamBuilder(
              stream: db.getStages(widget.numPag),
              builder: (context, AsyncSnapshot<List<Stage>> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString(),
                        style: TextStyle(backgroundColor: Colors.red)),
                  );
                }
                if (!snapshot.hasData) {
                  return Center(
                    child: Text("No hay Datos",
                        style: TextStyle(backgroundColor: Colors.red)),
                  );
                }
                List<Stage> listaEscenarios = snapshot.data;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 429,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: listaEscenarios.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, position) {
                          return GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: Container(
                                  color: Colors.lime,
                                  height: 150,
                                  width: 300.0,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        listaEscenarios[position].nombreStage,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CartasConcierto(
                                              idEsc: listaEscenarios[position]
                                                  .nombreStage,
                                              numDia: widget.numPag)),
                                    ],
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        bottomNavigationBar: BotonesBajo(),
        backgroundColor: Color.fromRGBO(243, 156, 18, 1),
      ),
    );
  }
}

class DiaConcierto extends StatefulWidget {
  final String dia;
  DiaConcierto({Key key, this.dia}) : super(key: key);

  @override
  _DiaState createState() => _DiaState();
}

class _DiaState extends State<DiaConcierto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(255, 255, 102, 0.9),
      child: Center(
        child: Text(
          widget.dia,
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
/*
class ListadoConciertos extends StatefulWidget {
  @override
  _ListadoConciertosState createState() => _ListadoConciertosState();
}

class _ListadoConciertosState extends State<ListadoConciertos> {
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
                child: CartasConcierto(
                    //escenarios[0].conciertosStage[0],
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}*/

class CartasConcierto extends StatefulWidget {
  final String idEsc, numDia;
  CartasConcierto({Key key, this.idEsc, this.numDia}) : super(key: key);
  @override
  _CartasConciertoState createState() => _CartasConciertoState();
}

class _CartasConciertoState extends State<CartasConcierto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
        child: StreamBuilder(
          stream: db.getConciertos(widget.numDia, widget.idEsc),
          builder: (context, AsyncSnapshot<List<Concierto>> snapshot) {
            List<Concierto> conc = snapshot.data;
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString(),
                    style: TextStyle(backgroundColor: Colors.red)),
              );
            }
            if (!snapshot.hasData) {
              return Center(
                child: Text("No hay Datos",
                    style: TextStyle(backgroundColor: Colors.red)),
              );
            }
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,

              /*separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey,
                  );
                },*/
              itemCount: conc.length,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8WwvDPWAnGFOYpN16XU0YHnwI4jmAJhiI5AEU8JnL_-kvku6Atw&s'),
                );
                
                /*new SizedBox(
                   child: ListTile(
                      /*leading: Image.network(
                        conc[index].imagenGrupo,
                        height: 10,
                        width: 10,
                      ),*/
                      title: Text(conc[index].nombreGrupo),
                      subtitle: Text(
                          conc[index].horaInicio + " - " + conc[index].horaFinal),
                      trailing: Icon(
                        Icons.star,
                        color: Colors.red,
                      ),
                      onTap: () {
                        /*Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Conciertos()),
                                      );*/
                      },
                      //isThreeLine: true,
                    ),
                    //color: Colors.yellow,
                  
                );*/
              },
            );
          }),
    );
  }
}

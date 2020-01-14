import 'package:festival/concierto/concierto.dart';
import 'package:festival/concierto/concerts.dart';
import 'package:festival/dia/dia.dart';
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

/*class Stages extends StatefulWidget {
  
  @override
  _StagesState createState() => _StagesState();
}*/

class Stages extends StatefulWidget {
  final String numPag;
  Stages({Key key, this.numPag}) : super(key: key);
  @override
  _StagesState createState() => _StagesState();
}

class _StagesState extends State<Stages> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: BotonesArriba(),
        body: StreamBuilder(
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
              children: <Widget>[
              GestureDetector(
                onTap: () {
                  //Navigator.of(context).push();
                },
                child: ListView.builder(
                    itemCount: listaEscenarios.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title:Text( listaEscenarios[index].nombreStage),
                      );
                    }),
              ),
              //ListadoConciertos(),
            ]);
          },
        ),
        bottomNavigationBar: BotonesBajo(),
        backgroundColor: Color.fromRGBO(243, 156, 18, 1),
      ),
    );
  }
}

/*class Dia extends StatefulWidget {
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
                "Miercoles",
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
}*/
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
                child: CartaConcierto(
                    //escenarios[0].conciertosStage[0],
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CartaConcierto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: db.getConciertos(),
          builder: (context, AsyncSnapshot<List<Concierto>> snapshot) {
            List<Concierto> conc = snapshot.data;
            return Column(
              children: <Widget>[
                Text("Nombre escenario"),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: Colors.grey,
                          );
                        },
                        itemCount: conc.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: Image.network(
                                conc[index].imagenGrupo,
                                height: 70,
                                width: 70,
                              ),
                              title: Text(conc[index].nombreGrupo),
                              subtitle: Text(conc[index].horaInicio +
                                  " - " +
                                  conc[index].horaFinal),
                              trailing: Icon(
                                Icons.star,
                                color: Colors.red,
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Conciertos()),
                                );
                              },
                              isThreeLine: true,
                            ),
                            color: Colors.yellow,
                          );
                        },
                      ),
                      /*Icon(
                      Icons.calendar_view_day
                    )*/
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}*/

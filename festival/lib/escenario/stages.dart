import 'package:festival/concierto/concierto.dart';
import 'package:festival/concierto/concerts.dart';
import 'package:festival/dia/dia.dart';
import 'package:flutter/material.dart';
import 'escenario.dart';
import 'package:festival/dataservice.dart' as db;

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
            padding: const EdgeInsets.only(left:55.0, right: 10),
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

class ListadoConciertos extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(255, 255, 102, 0.9),
      height: 100,
      child: Row(
        children: <Widget>[    
          Text("hola"),  
          //CartaConcierto(),
        ],
      ),
    );
  }
}


/*
class CartaConcierto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: db.getConciertos(),
        builder: (context, AsyncSnapshot<List<Concierto>> snapshot){
          List<Concierto> conc = snapshot.data;
          return Column(
            children: <Widget>[
              Text("Nombre escenario"),
              Expanded(
                child: Row(
                  children: <Widget>[
                    ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index){
                        return Divider(
                          color: Colors.grey,
                          );
                      },
                      itemCount: conc.length,
                      itemBuilder: (context, index){
                        return Card(
                            child: ListTile(
                            leading: Image.network(
                              conc[index].imagenGrupo,
                              height: 70,
                              width: 70,
                            ), 
                            title: Text(conc[index].nombreGrupo), 
                            subtitle: Text(conc[index].horaInicio + " - " + conc[index].horaFinal),
                            trailing: Icon(
                              Icons.star,
                              color: Colors.red,                              
                            ),
                            onTap: (){
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Conciertos()),
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
        }
      ),
    );
  }
}*/

class Stages extends StatefulWidget {
  final Dia numPag;
  Stages({Key key, @required this.numPag}) : super(key: key);

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
              //Dia(),
              SizedBox(height: 10,),
              ListadoConciertos(),
            ],
          )
        ),
      ),
    );
  }
}
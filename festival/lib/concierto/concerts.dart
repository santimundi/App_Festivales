import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festival/concierto/concierto.dart';
import 'package:festival/grupo/infoGroup.dart';
import 'package:flutter/material.dart';
import 'package:festival/dataservice.dart' as db;


class DiaStage extends StatelessWidget {
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
                //conciertos.dia,
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

class ListConcerts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: db.getConciertos(),
        builder: (context, AsyncSnapshot<List<Concierto>> snapshot){
          List<Concierto> conciertos = snapshot.data;
          return Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index){
                return Divider(
                  color: Colors.grey,
                  );
              },
              scrollDirection: Axis.vertical,
              itemCount: conciertos.length,
              itemBuilder: (context, index){
                return Card(
                    child: ListTile(
                    leading: Image.network(
                      conciertos[index].imagenGrupo,
                      height: 70,
                      width: 70,
                    ), 
                    title: Text(conciertos[index].nombreGrupo), 
                    subtitle: Text(conciertos[index].horaInicio + " - " + conciertos[index].horaFinal),
                    trailing: Icon(
                      Icons.star,
                      color: Colors.red,
                      
                    ),
                    onTap: (){
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoGroup(con: conciertos[index])),
                      );
                    },
                    isThreeLine: true,
                  ),
                  color: Colors.yellow,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class Conciertos extends StatefulWidget {
  @override
  _ConciertosState createState() => _ConciertosState();
}

class _ConciertosState extends State<Conciertos> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color.fromRGBO(243, 156, 18, 1),
          child: Column(
            children: <Widget>[
              DiaStage(),
              SizedBox(height: 20,),
              ListConcerts(),
              
            ],
          )
        ),
      ),
    );
  }
}

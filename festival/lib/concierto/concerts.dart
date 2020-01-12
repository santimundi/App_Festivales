import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festival/concierto/concierto.dart';
import 'package:festival/grupo/infoGroup.dart';
import 'package:flutter/material.dart';
import 'package:festival/dataservice.dart' as db;


class DiaStage extends StatelessWidget {
  @override
  /*Widget build(BuildContext context) {
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
  }*/
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Información',
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
              DiaStage(),
              SizedBox(height: 20,),
              ListConcerts(),
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
                onPressed: () => Navigator.of(context).pushNamed('/stages'),
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
                      Icons.star
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
/*
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
*/
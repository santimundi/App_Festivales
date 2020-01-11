import 'package:festival/escenario/escenario.dart';
import 'package:flutter/material.dart';


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
                blue.conciertosStage[1].dia,
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
/*
class Listgroups extends StatefulWidget {
  @override
  _ListgroupsState createState() => _ListgroupsState();
}

class _ListgroupsState extends State<Listgroups> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: .length,
        itemBuilder: (context, index) {
        return ListTile(
          leading: Image.network(wonders[index].imageUrl), 
          title: Text(wonders[index].name), 
          subtitle: Text(wonders[index].country),);
      },
    );
  }
}*/

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
              //Listgroups(),
            ],
          )
        ),
      ),
    );
  }
}

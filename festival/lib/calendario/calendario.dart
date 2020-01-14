import 'package:festival/concierto/concierto.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festival/dataservice.dart' as db;

class Calendario extends StatefulWidget {
  final String idEsc, numDia;
  Calendario({Key key, this.idEsc, this.numDia}) : super(key: key);

  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Timeline',
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
      ),
      body: Column(
        children: <Widget>[
          _selector(),
          StreamBuilder(
            stream: Firestore.instance.collection('Dia')
                  .where('Dia_Semana', isEqualTo: 'Miercoles')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Loading...');
              return ListView.builder(
                itemExtent: 100,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) =>
                    _product(context, snapshot.data.documents[index]),
              );
            },
          ),
        ],
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
    );
  }

  Widget _product(BuildContext context, DocumentSnapshot document) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                document['horaInicio'] + ' - ' + document['horaFinal'],
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(width: 50),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      document['nombreGrupo'],
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(243, 156, 18, 1),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      document['Nombre_Escenario'],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _selector() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.black,
                onPressed: () => Navigator.pop(context, false),
              ),
              Text(
                'Wednesday',
                style: TextStyle(fontSize: 30),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                color: Colors.black,
                onPressed: () => Navigator.pop(context, false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
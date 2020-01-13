import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festival/dia/dia.dart';
import 'package:festival/escenario/escenario.dart';
import 'package:festival/escenario/stages.dart';
import 'package:festival/grupo/infoGroup.dart';
import 'package:flutter/material.dart';
import 'package:festival/dataservice.dart' as db;

class BotonesDias extends StatelessWidget {
  final List<Dia> dies;
  const BotonesDias({Key key, @required this.dies}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: dies.length,
        itemBuilder: (context, index) {
          return ButtonTheme(
            minWidth: 250,
            height: 50,
            child: OutlineButton(
              child: Text(
                "Holaaa"
                //dies[index].diaSemana
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Stages(
                            numPag: dies[index],
                          )),
                );
              },
              highlightColor: Colors.yellow,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              borderSide: BorderSide(color: Colors.yellow, width: 2.0),
              textColor: Colors.yellow,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
    );
  }
}

class Dias extends StatefulWidget {
  @override
  _DiasState createState() => _DiasState();
}

class _DiasState extends State<Dias> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Center(
            child: Expanded(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 200,
                  ),
                  StreamBuilder(
                    stream: db.getDias(),
                    builder: (context, AsyncSnapshot<List<Dia>> snapshot) {
                      return Expanded(
                        child: Column(
                          children: <Widget>[
                            BotonesDias(dies: snapshot.data),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
        )),
        backgroundColor: Color.fromRGBO(243, 156, 18, 1),
      ),
    );
  }
}

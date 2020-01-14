import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festival/dia/dia.dart';
import 'package:festival/escenario/escenario.dart';
import 'package:festival/escenario/stages.dart';
import 'package:festival/grupo/infoGroup.dart';
import 'package:flutter/material.dart';
import 'package:festival/dataservice.dart' as db;
import 'package:flutter/rendering.dart';

class BotonDia extends StatelessWidget {
  final Dia diaFesti;
  const BotonDia(this.diaFesti);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Stages(numPag: diaFesti.idDia,)
        ));
      },
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            diaFesti.diaCalendario,
            style: TextStyle(fontSize: 30),
          ),
          Expanded(
            child: new Container(),
          )
        ],
      ),
      leading: Icon(Icons.calendar_today),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            diaFesti.diaSemana,
            style: TextStyle(fontSize: 30),
          ),
          Expanded(
            child: new Container(),
          )
        ],
      ),
    );
  }
}

class BotonesDias extends StatelessWidget {
  final List<Dia> dies;
  const BotonesDias({Key key, @required this.dies}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: dies.length,
      itemBuilder: (context, index) {
        return BotonDia(dies[index]);
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 70,
          indent: 0,
          endIndent: 0,
        );
      },
    );
  }
}

class BotonesArriba extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Dias',
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

class Dias extends StatefulWidget {
  @override
  _DiasState createState() => _DiasState();
}

class _DiasState extends State<Dias> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: BotonesArriba(),
        body: StreamBuilder(
          stream: db.getDias(),
          builder: (context, AsyncSnapshot<List<Dia>> snapshot) {
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
            return BotonesDias(dies: snapshot.data);
          },
        ),
        bottomNavigationBar: BotonesBajo(),
        backgroundColor: Color.fromRGBO(243, 156, 18, 1),
      ),
    );
  }
}

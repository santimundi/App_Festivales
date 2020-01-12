import 'package:flutter/material.dart';
import 'package:festival/concierto/concierto.dart';

class InfoGroup extends StatelessWidget {
   Concierto con;
   InfoGroup({Key key, @required this.con}) : super(key: key);
   @override
   Widget build(BuildContext context){
     return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color.fromRGBO(243, 156, 18, 1),
          child: Column(
            children: <Widget>[
              Iconos(),
              Foto(con.imagenGrupo),
              Informacion(concierto: con,),
              //Pie();
            ],
          )
        ),
      ),
     );
   }
}

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
              'Información', 
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

class Foto extends StatefulWidget {
  final String imagenGrupo;

  Foto(this.imagenGrupo);

  @override
  _FotoState createState() => _FotoState();
}

class _FotoState extends State<Foto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275,
      width: MediaQuery.of(context).size.width,
      child: Image.network(
        widget.imagenGrupo,
        fit: BoxFit.cover,
      )   
    );
  }
}

class Informacion extends StatelessWidget {
  Concierto concierto;
  Informacion({Key key, @required this.concierto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 22,
    );
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Artista:', style: textStyle),
              SizedBox(width: 20),
              Text(concierto.nombreGrupo, style: textStyle),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Escenario:', style: textStyle),
              SizedBox(width: 20),
              Text(concierto.escenario, style: textStyle),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Dia:', style: textStyle),
              SizedBox(width: 20),
              Text(concierto.dia, style: textStyle),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Hora inicio:', style: textStyle),
              SizedBox(width: 20),
              Text(concierto.horaInicio, style: textStyle),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Hora fin:', style: textStyle),
              SizedBox(width: 20),
              Text(concierto.horaFinal, style: textStyle),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(
                Icons.favorite,
                color: Colors.red,
                size: 50,
              ),
              SizedBox(width: 20),
            ],
          ),
        ],
      ),
    );
  }
}
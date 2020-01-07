import 'package:flutter/material.dart';
import 'concierto.dart';
import 'grupo.dart';

class InfoGroup extends StatelessWidget {
  final Concierto concierto = linkinparkconcierto;
  final Grupo grupo = linkinparkgrupo;

   @override
   Widget build(BuildContext context){
     return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.yellow,
          child: Column(
            children: <Widget>[
              Iconos(),
              Foto(grupo),
              Informacion(concierto, grupo),
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
      padding: const EdgeInsets.only(top: 50, right: 20, left:20, bottom: 20),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
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
          ),
        ],
      ),
    );
  }
}

class Foto extends StatelessWidget {
  final Grupo grupo;

  Foto(this.grupo);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275,
      child:Row(
        children: <Widget>[
          Image.asset(this.grupo.imagenGrupo), //no se muestra, 40:11
        ],
      ),     
    );
  }
}

class Informacion extends StatelessWidget {
  final Grupo grupo;
  final Concierto concierto;

  Informacion(this.grupo, this.concierto);

  @override
  Widget build(BuildContext context) {
    return Container(
      //falta listar la informacion del grupo, una columna
    );
  }
}

void main(){
  runApp(InfoGroup());
}
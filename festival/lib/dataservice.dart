import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festival/concierto/concerts.dart';
//import 'package:flutter/cupertino.dart';

Stream<List<Conciertos>> getConciertos(){
  return Firestore.instance.collection('Concierto').snapshots().map(toConciertoList);
}

/*
class DatabaseService {

  final String codigoIDConcierto;
  DatabaseService({this.codigoIDConcierto});

  final CollectionReference concertCollection = Firestore.instance.collection('concierto');
  
  Future updateConcertData(String codigoIDConcierto, String codigoIDGrupo, String imagenGrupo, String escenario, String dia, String horaInicio, String horaFinal) async {
    return await concertCollection.document(codigoIDConcierto).setData({
        "codigoIDConcierto": codigoIDConcierto,
        "codigoIDGrupo": codigoIDGrupo,
        "imagenGrupo": imagenGrupo, //'assets/LP.jpg',
        "dia": dia,
        "horaInicio": horaInicio,
        "horaFinal": horaFinal,
        "escenario": escenario,
      }
    );
  }
}*/
import 'package:cloud_firestore/cloud_firestore.dart';
import 'concierto/concierto.dart';

Stream<List<Concierto>> getConciertos(){
  return Firestore.instance.collection('concierto').snapshots().map(toConciertoList);
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
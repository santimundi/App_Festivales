import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festival/dia/dia.dart';
import 'package:festival/escenario/escenario.dart';
import 'concierto/concierto.dart';

Stream<List<Dia>> getDias() {
  return Firestore.instance.collection('Dia').snapshots().map(toDiaList);
}

Stream<List<Stage>> getStage(String groupID) {
  return Firestore.instance
      .collection('Dia/$groupID/Escenario')
      .snapshots()
      .map(toStageList);
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

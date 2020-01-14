import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festival/dia/dia.dart';
import 'package:festival/escenario/escenario.dart';
import 'concierto/concierto.dart';

Stream<List<Dia>> getDias() {
  return Firestore.instance.collection('Dia').snapshots().map(toDiaList);
}

Stream<List<Stage>> getStages(String stageID) {
  return Firestore.instance
      .collection('Dia/$stageID/Escenario')
      .snapshots()
      .map(toStageList);
}

Stream<List<Concierto>> getConciertos(String dayID, String stageID){
  return Firestore.instance
      .collection('Dia/$dayID/Escenario/$stageID/Concierto')
      .snapshots()
      .map(toConciertoList);
}

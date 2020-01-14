import 'package:cloud_firestore/cloud_firestore.dart';

class Stage{
  String codigoIDStage, nombreStage;

  Stage({
    this.codigoIDStage, 
    this.nombreStage,
  });

  Stage.fromFirestore(DocumentSnapshot doc)
    : codigoIDStage = doc.documentID,
      nombreStage = doc.data['Nombre_Escenario'];
}

List<Stage> toStageList(QuerySnapshot query){
  return query.documents.map((doc) => Stage.fromFirestore(doc)).toList();
}
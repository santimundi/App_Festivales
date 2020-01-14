import 'package:cloud_firestore/cloud_firestore.dart';

class Dia{
  String idDia, diaCalendario, diaSemana;
  Dia({
    this.idDia,
    this.diaCalendario,
    this.diaSemana
  });

  Dia.fromFirestore(DocumentSnapshot doc)
    : idDia = doc.documentID,
      diaCalendario = doc.data['Dia_Calendario'],
      diaSemana = doc.data['Dia_Semana'];
      
}

List<Dia> toDiaList(QuerySnapshot query){
  return query.documents.map((doc) => Dia.fromFirestore(doc)).toList();
}
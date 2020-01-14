import 'package:cloud_firestore/cloud_firestore.dart';

class Concierto{
  String id, imagenGrupo, escenario;
  String dia, horaInicio, horaFinal; //DateTime, mirar como asignarla
  int codigoIDGrupo;
  String nombreGrupo, descripcionGrupo, anoFundadoGrupo;
  bool favorito;

  Concierto({
    this.id,
    this.nombreGrupo,
    this.imagenGrupo,
    this.horaInicio,
    this.horaFinal,
    this.descripcionGrupo, 
    this.anoFundadoGrupo, 
    this.favorito
  });

  Concierto.fromFirestore(DocumentSnapshot doc)
    : id = doc.documentID,
      nombreGrupo = doc.data['nombreGrupo'],
      imagenGrupo = doc.data['imagenGrupo'],
      horaInicio = doc.data['horaInicio'],
      horaFinal = doc.data['horaFinal'],
      descripcionGrupo = doc.data['descripcionGrupo'],
      anoFundadoGrupo = doc.data['anoFundadoGrupo'],
      favorito = doc.data['favoritos'];
}

List<Concierto> toConciertoList(QuerySnapshot query){
  return query.documents.map((doc) => Concierto.fromFirestore(doc)).toList();
}


final linkinparkconcierto = Concierto(
  id: '0',
  nombreGrupo: 'linkinpark',
  imagenGrupo: 'https://i2.sndcdn.com/avatars-000142079606-avzu5z-t500x500.jpg', //'assets/LP.jpg',
  horaInicio: '20:20',
  horaFinal: '21:00',
  descripcionGrupo: "Linkin Park és un grup de rock americà d'Agoura Hills (Califòrnia) format el 1996. Des de la seva formació, la banda ha venut més de 50 milions d'àlbums[1] i ha guanyat dos premis Grammy.[2][3]",
  favorito: false,
  anoFundadoGrupo: '1980'
);


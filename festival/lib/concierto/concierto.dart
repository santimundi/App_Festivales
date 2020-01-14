import 'package:cloud_firestore/cloud_firestore.dart';

class Concierto{
  String id, imagenGrupo, escenario;
  String dia, horaInicio, horaFinal; //DateTime, mirar como asignarla
  int codigoIDGrupo;
  String nombreGrupo, descripcionGrupo, anoFundadoGrupo;
  bool favorito;
  //List<String> productos, integrantesGrupo;

  Concierto({
    this.id,
    this.codigoIDGrupo,
    this.nombreGrupo,
    this.imagenGrupo,
    this.dia,
    this.horaInicio,
    this.horaFinal,
    this.escenario,
    this.descripcionGrupo, 
    this.anoFundadoGrupo, 
    this.favorito
    //this.integrantesGrupo, 
    //this.productos, 
  });

  Concierto.fromFirestore(DocumentSnapshot doc)
    : id = doc.documentID,
      codigoIDGrupo = doc.data['codigoIDGrupo'],
      nombreGrupo = doc.data['nombreGrupo'],
      imagenGrupo = doc.data['imagenGrupo'],
      dia = doc.data['dia'],
      horaInicio = doc.data['horaInicio'],
      horaFinal = doc.data['horaFinal'],
      escenario = doc.data['Escenario'],
      descripcionGrupo = doc.data['descripcionGrupo'],
      anoFundadoGrupo = doc.data['anoFundadoGrupo'],
      favorito = doc.data['favoritos'];
}

List<Concierto> toConciertoList(QuerySnapshot query){
  return query.documents.map((doc) => Concierto.fromFirestore(doc)).toList();
}

/*
final linkinparkconcierto = Concierto(
  codigoIDConcierto: '000',
  codigoIDGrupo: '000',
  imagenGrupo: 'https://i2.sndcdn.com/avatars-000142079606-avzu5z-t500x500.jpg', //'assets/LP.jpg',
  dia: '20-08-2020',
  horaInicio: '20:20',
  horaFinal: '21:00',
  escenario: 'Blue',
);

final gunsNRosesconcierto = Concierto(
  codigoIDConcierto: '001',
  codigoIDGrupo: '001',
  imagenGrupo: 'https://cdn.ontourmedia.io/gunsnroses/site_v2/animations/gnr_loop_logo_01.jpg', //'assets/LP.jpg',
  dia: '20-08-2020',
  horaInicio: '21:20',
  horaFinal: '22:00',
  escenario: 'Blue',
);

final beatles = Concierto(
  codigoIDConcierto: '002',
  codigoIDGrupo: '002',
  imagenGrupo: 'https://www.tuposter.com/pub/media/catalog/product/cache/image/700x560/91bbed04eb86c2a8aaef7fbfb2041b2a/t/h/the_beatles_font.png', //'assets/LP.jpg',
  dia: '20-08-2020',
  horaInicio: '22:20',
  horaFinal: '23:00',
  escenario: 'Blue',
);*/
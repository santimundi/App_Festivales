class Concierto{
  String codigoIDConcierto, codigoIDGrupo, imagenGrupo, escenario;
  String dia, horaInicio, horaFinal; //DateTime, mirar como asignarla

  Concierto({
    this.codigoIDConcierto,
    this.codigoIDGrupo,
    this.imagenGrupo,
    this.dia,
    this.horaInicio,
    this.horaFinal,
    this.escenario,
  });
}

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
);
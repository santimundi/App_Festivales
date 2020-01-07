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
class Concierto{
  String codigoIDConcierto, codigoIDGrupo, imagenGrupo;
  String dia, horaInicio, horaFinal; //DateTime, mirar como asignarla

  Concierto({
    this.codigoIDConcierto,
    this.codigoIDGrupo,
    this.imagenGrupo,
    this.dia,
    this.horaInicio,
    this.horaFinal,
  });
}

final linkinparkconcierto = Concierto(
  codigoIDConcierto: '000',
  codigoIDGrupo: '000',
  imagenGrupo: 'assets/LP.jpg',
  dia: '20-08-2020',
  horaInicio: '20:20',
  horaFinal: '21:000',
);
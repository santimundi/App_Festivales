class Grupo{
  String codigoIDGrupo, nombreGrupo, descripcionGrupo, anoFundadoGrupo, imagenGrupo;
  List<String> productos, integrantesGrupo;

  Grupo({
    this.codigoIDGrupo, 
    this.nombreGrupo, 
    this.descripcionGrupo, 
    this.anoFundadoGrupo, 
    this.integrantesGrupo, 
    this.imagenGrupo, 
    this.productos, 
  });
}

final linkinparkgrupo = Grupo(
  codigoIDGrupo: '000',
  nombreGrupo: 'LinkinPark',
  descripcionGrupo: 'Grupo nu-metal',
  anoFundadoGrupo: '1995',
  integrantesGrupo: ['El primero', 'El segundo', 'El tercero'],
  imagenGrupo: "'https://i2.sndcdn.com/avatars-000142079606-avzu5z-t500x500.jpg'", // 'assets/LP.jpg',
  productos: ['Camiseta', 'Sudadera', 'Pantalones'],
);
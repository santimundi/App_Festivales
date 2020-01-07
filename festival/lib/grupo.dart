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
  imagenGrupo: 'assets/LP.jpg',
  productos: ['Camiseta', 'Sudadera', 'Pantalones'],
);
//import 'package:cloud_firestore/cloud_firestore.dart';

class Merchandising {
  String codigoIDmerchandising, descripcion, imagenMerchandising;
  int precio, unidades;
  List<String> tallasrestantes;

  Merchandising({
    this.codigoIDmerchandising, 
    this.descripcion,
    this.imagenMerchandising,
    this.precio,
    this.unidades,
    this.tallasrestantes,
    });
}

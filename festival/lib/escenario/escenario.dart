import 'package:festival/concierto/concierto.dart';

class Stage{
  String codigoIDStage, nombreStage;
  List<Concierto> conciertosStage;

  Stage({
    this.codigoIDStage, 
    this.nombreStage,
    this.conciertosStage,
  });
}
/*
final blue = Stage(
  codigoIDStage: '000',
  nombreStage: 'blue',
  conciertosStage: [linkinparkconcierto, gunsNRosesconcierto]
);
*/

import '../../../resources/titulo.dart';
import 'hovip_reg_model.dart';

class HovipList {
  List<HovipReg> list = [];

  List<ToCelda> celdas = [
    ToCelda(valor: 'ID SAP', flex: 2),
    ToCelda(valor: 'PROYECTO', flex: 2),
    ToCelda(valor: 'SUBGERENCIA', flex: 2),
    ToCelda(valor: 'MACROCATEGORÍA', flex: 2),
  ];
}

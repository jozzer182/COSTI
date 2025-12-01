import 'package:costii/real/model/real_reg.dart';
import 'package:costii/real/model/rel_year_reg.dart';

import '../../resources/titulo.dart';


class RealList {
  List<RealReg> list = [];
  List<RealYearReg> listYear = [];

  List<ToCelda> celdas = [
    ToCelda(valor: 'Proyecto', flex: 2),
    ToCelda(valor: 'Naturaleza', flex: 2),
    ToCelda(valor: 'Mes', flex: 1),
    ToCelda(valor: 'Importe', flex: 1),
    ToCelda(valor: 'Denominación', flex: 2),
    ToCelda(valor: 'Doc.Compra', flex: 2),
    ToCelda(valor: 'Proveedor', flex: 2),
    ToCelda(valor: 'Usuario', flex: 2),
  ];

  List<ToCelda> celdasYear = [
    ToCelda(valor: 'Proyecto', flex: 6),
    ToCelda(valor: 'Naturaleza', flex: 4),
    ToCelda(valor: "01", flex: 2),
    ToCelda(valor: "02", flex: 2),
    ToCelda(valor: "03", flex: 2),
    ToCelda(valor: "04", flex: 2),
    ToCelda(valor: "05", flex: 2),
    ToCelda(valor: "06", flex: 2),
    ToCelda(valor: "07", flex: 2),
    ToCelda(valor: "08", flex: 2),
    ToCelda(valor: "09", flex: 2),
    ToCelda(valor: "10", flex: 2),
    ToCelda(valor: "11", flex: 2),
    ToCelda(valor: "12", flex: 2),
    ToCelda(valor: "Total", flex: 2),
  ];
}

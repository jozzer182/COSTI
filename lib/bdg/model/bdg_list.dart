import '../../resources/titulo.dart';
import 'bdg_reg.dart';
// import 'bdg_year_reg.dart';

class BdgList {
  List<BdgReg> list = [];
  // List<BdgYearReg> listYear = [];

  // List<ToCelda> celdas = [
  //   ToCelda(valor: 'Proyecto', flex: 2),
  //   ToCelda(valor: 'Naturaleza', flex: 2),
  //   ToCelda(valor: 'Mes', flex: 2),
  //   ToCelda(valor: 'Importe', flex: 2),
  // ];

  List<ToCelda> celdas = [
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

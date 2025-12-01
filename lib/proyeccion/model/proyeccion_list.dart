import 'package:costii/proyeccion/model/proyeccion_reg.dart';
import 'package:costii/proyeccion/model/proyeccion_reg_esp.dart';

import '../../resources/titulo.dart';

class ProyeccionList {
  List<ProyeccionReg> list = [];
  List<ProyeccionRegEsp> listEsp = [];

  List<ToCelda> celdas = [
    ToCelda(valor: 'Proyecto', flex: 7),
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

  List<ToCelda> celdasEsp = [
    ToCelda(valor: 'Proyecto', flex: 7),
    ToCelda(valor: 'Naturaleza', flex: 4),
    ToCelda(valor: 'Especialidad', flex: 4),
    ToCelda(valor: 'Contrato', flex: 3),
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

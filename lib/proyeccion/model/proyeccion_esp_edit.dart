import '../../bdg/model/bdg_reg.dart';
import '../../hovip_module/ejecutores/model/ejecutores_reg_model.dart';
import '../../hovip_module/proyectos/model/proyectos_reg.dart';
import '../../resources/titulo.dart';
import 'proyeccion_list_esp_calc.dart';
import 'proyeccion_reg_esp.dart';

class ProyeccionEspEdit {
  List<ProyeccionRegEsp> list = [];
  List<ProyeccionRegEsp> original = [];
  List<BdgReg> bdg = [];
  ProyectosReg proyectosReg = ProyectosReg.fromInit();
  List<ProyectosReg> proyectosList = [];
  EjecutoresReg ejecutoresReg = EjecutoresReg.fromInit();
  List<EjecutoresReg> ejecutoresList = [];

  ProyeccionListEspCalcModel get calculo => ProyeccionListEspCalcModel(this);

  List<ToCelda> celdas = [
    // ToCelda(valor: 'Proyecto', flex: 7),
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
    // ToCelda(valor: "Total(Mill)", flex: 2),
  ];
  List<ToCelda> celdasFiltro = [
    ToCelda(valor: 'Proyecto', flex: 5),
    ToCelda(valor: 'Naturaleza', flex: 2),
    ToCelda(valor: 'Especialidad', flex: 2),
    ToCelda(valor: 'Contrato', flex: 2),
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
    // ToCelda(valor: "Total(Mill)", flex: 2),
  ];
}

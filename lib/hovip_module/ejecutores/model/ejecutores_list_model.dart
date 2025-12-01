import 'ejecutores_reg_model.dart';

class EjecutoresList {
  List<EjecutoresReg> list = [];
  List<EjecutoresReg> hitorico = [];
  EjecutoresReg? nuevo;

  List<String> get funcionales =>
      list.expand((e) => e.funcionales).toSet().toList();
  List<String> get areas =>
      list.map((e) => e.area.toUpperCase()).toSet().toList();
  List<String> get controllers =>
      list.map((e) => e.controller.toUpperCase()).toSet().toList();
  List<String> get pms => list.map((e) => e.pm.toUpperCase()).toSet().toList();
}

import 'package:costii/hovip_module/ejecutores/model/ejecutores_reg_model.dart';

import '../../../resources/titulo.dart';
import '../../proyectos/model/proyectos_reg.dart';

class HovipReg {
  ProyectosReg proyecto;
  EjecutoresReg? ejecutores;

  HovipReg({
    required this.proyecto,
  });

  List<String> toList() {
    List<String> ejecutoresListString = ejecutores?.toList() ?? [];
    return [
      ...proyecto.toList(),
      ...ejecutoresListString,
    ];
  }

  Map<String, dynamic> toMap() {
    var map1 = proyecto.toMap();
    var map2 = ejecutores?.toMap() ?? {};
    return {
      ...map1,
      ...map2,
    };

  }

  List<ToCelda> get celdas => [
        ToCelda(valor: proyecto.idsap, flex: 2),
        ToCelda(valor: proyecto.proyecto, flex: 2),
        ToCelda(valor: proyecto.subgerencia, flex: 2),
        ToCelda(valor: proyecto.macroc, flex: 2),
      ];
}

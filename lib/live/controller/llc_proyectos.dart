import 'package:costii/hovip_module/sustitutos/model/sustitutos_reg.dart';

import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../hovip_module/proyectos/model/proyectos_reg.dart';
import '../model/live_reg.dart';

class LLCProyectos {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;

  LLCProyectos(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  asignar(LiveReg liveReg, String proyecto) {
    List<ProyectosReg> idProyList = state()
            .proyectosList
            ?.list
            .where((e) => e.proyecto.toUpperCase() == proyecto.toUpperCase())
            .toList() ??
        [];
    if (idProyList.isNotEmpty) {
      liveReg.proyectosReg = idProyList.first;
      return;
    }
    List<SustitutosReg> sustitutosList = state()
            .sustitutosList
            ?.list
            .where(
                (e) => e.proyectoviejo.toUpperCase() == proyecto.toUpperCase())
            .toList() ??
        [];
    if (sustitutosList.isNotEmpty) {
      String id = sustitutosList.first.idproyecto;
      idProyList = state()
              .proyectosList
              ?.list
              .where((e) => e.id.toUpperCase() == id.toUpperCase())
              .toList() ??
          [];
      if (idProyList.isNotEmpty) {
        liveReg.proyecto = idProyList.first.proyecto;
        liveReg.proyectosReg = idProyList.first;
        return;
      }
    }
  }
}

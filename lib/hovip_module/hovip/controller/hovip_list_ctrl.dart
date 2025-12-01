import 'package:costii/hovip_module/ejecutores/model/ejecutores_reg_model.dart';
import 'package:costii/hovip_module/hovip/model/hovip_list_model.dart';
import 'package:costii/hovip_module/hovip/model/hovip_reg_model.dart';
import 'package:costii/hovip_module/proyectos/model/proyectos_reg.dart';

import '../../../bloc/main__bl.dart';
import '../../../bloc/main_bloc.dart';

class HovipListController {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;

  HovipListController(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  get crear {
    HovipList hovipList = HovipList();
    try {
      List<ProyectosReg> proyectosList = state().proyectosList?.list ?? [];
      List<EjecutoresReg> ejecutoresList = state().ejecutoresList?.list ?? [];
      for (ProyectosReg proyectosReg in proyectosList) {
        HovipReg hovipreg = HovipReg(proyecto: proyectosReg);
        List<EjecutoresReg> ejecutoresRegList = ejecutoresList
            .where(
              (e) => e.idproyecto == proyectosReg.id,
            )
            .toList();
        if (ejecutoresRegList.isNotEmpty) {
          hovipreg.ejecutores = ejecutoresRegList.first;
        }
        hovipList.list.add(hovipreg);
      }
      emit(state().copyWith(hovipList: hovipList));
      print("hovipList: ${hovipList.list.length}");
    } catch (e) {
      bl.errorCarga("HOVIP", e);
    }
  }
}

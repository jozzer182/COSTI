import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../hovip_module/ejecutores/model/ejecutores_reg_model.dart';
import '../model/live_reg.dart';

class LLCEjecutores {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;

  LLCEjecutores(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  asignar(LiveReg liveReg) {
    List<EjecutoresReg> ejecutores = state()
            .ejecutoresList
            ?.list
            .where((e) => e.idproyecto == liveReg.proyectosReg.id)
            .toList() ??
        [];
    if (ejecutores.isNotEmpty) {
      liveReg.area = ejecutores.first.area.toUpperCase();
      liveReg.ejecutoresReg = ejecutores.first;
    }
  }
}

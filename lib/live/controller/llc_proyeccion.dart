import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../proyeccion/model/proyeccion_list.dart';
import '../../proyeccion/model/proyeccion_reg.dart';
import '../../proyeccion/model/proyeccion_reg_esp.dart';
import '../model/live_reg.dart';

class LLCProyeccion {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;

  LLCProyeccion(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  asignar(LiveReg liveReg) {
    ProyeccionList proyeccionList = state().proyeccionList ?? ProyeccionList();

    List<ProyeccionReg> proyeccionListYear = proyeccionList.list
        .where(
          (element) => element.year == 2025,
        )
        .toList();
    //AGREGAR PROYECCION
    ProyeccionReg proyeccionReg = proyeccionListYear.firstWhere(
      (e) =>
          e.proyecto.toUpperCase() == liveReg.proyecto.toUpperCase() &&
          e.naturaleza.toUpperCase().contains(
                liveReg.naturaleza.toUpperCase().substring(0, 3),
              ),
      orElse: () => ProyeccionReg.fromInit(),
    );
    liveReg.proyeccion = proyeccionReg;

    //AGREGAR PROYECCION ESPECIAL
    List<ProyeccionRegEsp> proyeccionRegEsp = proyeccionList.listEsp
        .where((e) =>
            e.proyecto.toUpperCase() == liveReg.proyecto.toUpperCase() &&
            e.naturaleza.toUpperCase().contains(
                  liveReg.naturaleza.toUpperCase().substring(0, 3),
                ))
        .toList();
    liveReg.proyeccionEsp = proyeccionRegEsp;
  }
}

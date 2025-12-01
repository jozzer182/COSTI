import 'package:costii/bdg/model/bdg_list.dart';
import 'package:costii/live/controller/llc_bdg.dart';
import 'package:costii/live/model/live_list.dart';
import 'package:costii/proyeccion/model/proyeccion_list.dart';
import 'package:costii/real/model/real_list.dart';
import 'package:costii/resources/a_entero_2.dart';
import 'package:costii/resources/constants/meses.dart';

import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../resources/constants/years.dart';
import '../model/live_reg.dart';
import 'llc_ejecutores.dart';
import 'llc_proyeccion.dart';
import 'llc_proyectos.dart';
import 'llc_real.dart';

class LiveListController {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;
  LiveList liveListInit = LiveList();

  LiveListController(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  LLCBdg get llcBdg => LLCBdg(bl);
  LLCReal get llcReal => LLCReal(bl);
  LLCProyeccion get llcProyeccion => LLCProyeccion(bl);
  LLCEjecutores get llcEjecutores => LLCEjecutores(bl);
  LLCProyectos get llcProyectos => LLCProyectos(bl);

  get calcular async {
    for (String year in years) {
      List<String> proyectos = _traerProyectos(year);
      for (String proyecto in proyectos) {
        for (String naturaleza in ["Servicios", "Materiales", "Otros Costos"]) {
          bool esNuevo = true;
          LiveReg liveReg = LiveReg();
          liveReg.proyecto = proyecto;
          liveReg.year = year;
          liveReg.naturaleza = naturaleza;

          llcProyectos.asignar(liveReg, proyecto);

          if (liveListInit.list.any((e) =>
              e.proyectosReg == liveReg.proyectosReg &&
              e.naturaleza == naturaleza)) {
            liveReg = liveListInit.list.firstWhere((e) =>
                e.proyectosReg == liveReg.proyectosReg &&
                e.naturaleza == naturaleza);
            esNuevo = false;
          }

          if (liveReg.proyectosReg.id.isNotEmpty) {
            llcEjecutores.asignar(liveReg);
          }

          llcBdg.asignar(liveReg);

          llcReal.asignar(liveReg, proyecto);

          llcProyeccion.asignar(liveReg);

          //CORRECCIÓN DE LIVE
          _setLive(liveReg);

          if (esNuevo) liveListInit.list.add(liveReg);
        }
      }
    }
    emit(state().copyWith(liveList: liveListInit));
    print("LIVE: ${liveListInit.list.length}");
  }

  _setLive(LiveReg liveReg) {
    String year = '2025';
    String thisYear = DateTime.now().year.toString();
    int thisMonth = DateTime.now().month;

    //CORRECCIÓN DE LIVE
    if (year == thisYear) {
      for (int mes in meses) {
        bool active = mes >= thisMonth;
        int value = active
            ? liveReg.proyeccion.getByMonth(mes)
            : liveReg.real.getByMonth(mes);
        liveReg.setByMonth(mes, active, value);
      }
    } else {
      for (int mes in meses) {
        bool active = aEntero(year) > aEntero(thisYear);
        int value = liveReg.real.getByMonth(mes);
        liveReg.setByMonth(mes, active, value);
      }
    }
  }

  List<String> _traerProyectos(String year) {
    ProyeccionList proyeccionList = state().proyeccionList ?? ProyeccionList();
    BdgList bdgList = state().bdgList ?? BdgList();
    RealList realList = state().realList ?? RealList();

    List<String> proyeccionListYear = proyeccionList.list
        .where((element) => element.year == aEntero(year))
        .map((e) => e.proyecto.toUpperCase())
        .toList();
    List<String> bdgListYear = bdgList.list
        .where((element) => element.year.toString() == year)
        .map((e) => e.proyecto.toUpperCase())
        .toList();
    List<String> realListYear = realList.listYear
        .where((element) => element.year == year)
        .map((e) => e.nomproyecto.toUpperCase())
        .toList();
    // ignore: prefer_collection_literals
    List<String> proyectos = [
      ...bdgListYear,
      ...realListYear,
      ...proyeccionListYear,
    ].toSet().toList();
    proyectos.sort();
    return proyectos;
  }
}

import 'package:collection/collection.dart';

import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../live/model/live_reg.dart';
import '../model/proyeccion_esp_edit.dart';
import '../model/proyeccion_reg_esp.dart';

class CtrlPeeLiveEdit {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;

  CtrlPeeLiveEdit(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  crear(List<LiveReg> valores) {
    List<String> proyectos =
        valores.map((e) => e.proyectosReg.id).toSet().toList();
    proyectos.removeWhere((item) => item.isEmpty);
    ProyeccionEspEdit pCopy = ProyeccionEspEdit();
    // print('proyectos: $proyectos');
    for (String idproy in proyectos) {
      List<ProyeccionRegEsp> list = state()
              .proyeccionList
              ?.listEsp
              .where((e) => e.idproy == idproy)
              .toList() ??
          [];
      List<ProyeccionRegEsp> reducedList = _justOne(idproy, list);
      pCopy.list.addAll(reducedList.map((e) => e.copyWith()));
      pCopy.original.addAll(reducedList.map((e) => e.copyWith()));
    }
    // print('pCopy.list: ${pCopy.list.length}');
    emit(state().copyWith(
      pCopy: pCopy,
    ));
  }

  cambiarCheck(LiveReg liveReg) {
    ProyeccionEspEdit pCopy = state().pCopy!;
    ProyeccionRegEsp reg = pCopy.list.firstWhere((e) =>
        e.idproy == liveReg.proyectosReg.id &&
        e.naturaleza.toUpperCase() == liveReg.naturaleza.toUpperCase());
    reg.revisado =
        reg.revisado.toUpperCase() == 'TRUE' ? false.toString() : 'TRUE';
    emit(state().copyWith(
      pCopy: pCopy,
    ));
  }

  List<ProyeccionRegEsp> _justOne(String idproy, List<ProyeccionRegEsp> list) {
    List<ProyeccionRegEsp> reducedList = [];

    for (ProyeccionRegEsp reg in list) {
      bool noMaterial = reducedList.firstWhereOrNull((e) =>
              e.idproy == idproy &&
              e.naturaleza.toUpperCase() == "MATERIALES") ==
          null;
      bool noServicios = reducedList.firstWhereOrNull((e) =>
              e.idproy == idproy &&
              e.naturaleza.toUpperCase() == "SERVICIOS") ==
          null;
      bool noOtros = reducedList.firstWhereOrNull((e) =>
              e.idproy == idproy &&
              e.naturaleza.toUpperCase() == "OTROS COSTOS") ==
          null;
      if (noMaterial && reg.naturaleza.toUpperCase() == "MATERIALES") {
        ProyeccionRegEsp regCopy = reg.copyWith();
        if (list.any((e) =>
            e.revisado.toUpperCase() == 'TRUE' &&
            e.naturaleza.toUpperCase() == "MATERIALES" &&
            e.idproy == idproy)) {
          regCopy.revisado = 'TRUE';
        }
        reducedList.add(regCopy);
        continue;
      }
      if (noServicios && reg.naturaleza.toUpperCase() == "SERVICIOS") {
        ProyeccionRegEsp regCopy = reg.copyWith();
        if (list.any((e) =>
            e.revisado.toUpperCase() == 'TRUE' &&
            e.naturaleza.toUpperCase() == "SERVICIOS" &&
            e.idproy == idproy)) {
          regCopy.revisado = 'TRUE';
        }
        reducedList.add(regCopy);
        continue;
      }
      if (noOtros && reg.naturaleza.toUpperCase() == "OTROS COSTOS") {
        ProyeccionRegEsp regCopy = reg.copyWith();
        if (list.any((e) =>
            e.revisado.toUpperCase() == 'TRUE' &&
            e.naturaleza.toUpperCase() == "OTROS COSTOS" &&
            e.idproy == idproy)) {
          regCopy.revisado = 'TRUE';
        }
        reducedList.add(regCopy);
        continue;
      }
      if (!noMaterial && !noServicios && !noOtros) break;
    }

    return reducedList;
  }
}

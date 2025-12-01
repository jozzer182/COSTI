import 'dart:convert';

import 'package:costii/hovip_module/ejecutores/model/ejecutores_reg_model.dart';
import 'package:http/http.dart';

import '../../bdg/model/bdg_reg.dart';
import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../hovip_module/proyectos/model/proyectos_reg.dart';
import '../../live/model/live_reg.dart';
import '../../resources/constants/url.dart';
import '../model/proyeccion_esp_edit.dart';
import '../model/proyeccion_reg_esp.dart';
import 'pee_ctrl_live_edit.dart';
import 'pee_ctrl_pegar_excel.dart';

class ProyeccionEspEditCtrl {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;

  ProyeccionEspEditCtrl(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  CtrlPeePegarExcel get pegarExcel => CtrlPeePegarExcel(bl);
  CtrlPeeLiveEdit get liveEdit => CtrlPeeLiveEdit(bl);

  create(String idproy) {
    print('idproy: $idproy');
    ProyeccionEspEdit proyeccionEspEdit = ProyeccionEspEdit();
    ProyeccionEspEdit proyeccionEspEditCopy = ProyeccionEspEdit();
    List<ProyeccionRegEsp> list = state()
            .proyeccionList
            ?.listEsp
            .where((e) => e.idproy == idproy)
            .toList() ??
        [];
    List<BdgReg> bdg =
        state().bdgList?.list.where((e) => e.idproy == idproy).toList() ?? [];
    ProyectosReg proyectosReg = state().proyectosList?.list.firstWhere(
              (e) => e.id == idproy,
              orElse: () => ProyectosReg.fromInit(),
            ) ??
        ProyectosReg.fromInit();
    EjecutoresReg ejecutoresReg = state().ejecutoresList?.list.firstWhere(
              (e) => e.idproyecto == idproy,
              orElse: () => EjecutoresReg.fromInit(),
            ) ??
        EjecutoresReg.fromInit();

    proyeccionEspEdit.list = list.map((e) => e.copyWith()).toList();
    proyeccionEspEdit.original = list.map((e) => e.copyWith()).toList();
    proyeccionEspEdit.bdg = bdg;
    proyeccionEspEdit.proyectosReg = proyectosReg;
    proyeccionEspEdit.ejecutoresReg = ejecutoresReg;

    proyeccionEspEditCopy.list = list.map((e) => e.copyWith()).toList();
    proyeccionEspEditCopy.original = list.map((e) => e.copyWith()).toList();
    proyeccionEspEditCopy.bdg = bdg;
    proyeccionEspEditCopy.proyectosReg = proyectosReg;
    proyeccionEspEditCopy.ejecutoresReg = ejecutoresReg;

    emit(state().copyWith(
      pEdit: proyeccionEspEdit,
      pCopy: proyeccionEspEditCopy,
    ));
  }

  createWithList(List<LiveReg> liveReg) {
    List<String> proyectos =
        liveReg.map((e) => e.proyectosReg.id).toSet().toList();
    proyectos.removeWhere((item) => item.isEmpty);
    ProyeccionEspEdit proyeccionEspEdit = ProyeccionEspEdit();
    ProyeccionEspEdit proyeccionEspEditCopy = ProyeccionEspEdit();
    print('proyectos: $proyectos');
    for (String idproy in proyectos) {
      List<ProyeccionRegEsp> list = state()
              .proyeccionList
              ?.listEsp
              .where((e) => e.idproy == idproy)
              .toList() ??
          [];
      List<BdgReg> bdg =
          state().bdgList?.list.where((e) => e.idproy == idproy).toList() ?? [];
      ProyectosReg proyectosReg = state().proyectosList?.list.firstWhere(
                (e) => e.id == idproy,
                orElse: () => ProyectosReg.fromInit(),
              ) ??
          ProyectosReg.fromInit();
      EjecutoresReg ejecutoresReg = state().ejecutoresList?.list.firstWhere(
                (e) => e.idproyecto == idproy,
                orElse: () => EjecutoresReg.fromInit(),
              ) ??
          EjecutoresReg.fromInit();

      proyeccionEspEdit.list.addAll(list.map((e) => e.copyWith()).toList());
      proyeccionEspEdit.original.addAll(list.map((e) => e.copyWith()).toList());
      proyeccionEspEdit.bdg.addAll(bdg);
      proyeccionEspEdit.proyectosList.add(proyectosReg);
      proyeccionEspEdit.ejecutoresList.add(ejecutoresReg);

      proyeccionEspEditCopy.list.addAll(list.map((e) => e.copyWith()).toList());
      proyeccionEspEditCopy.original
          .addAll(list.map((e) => e.copyWith()).toList());
      proyeccionEspEditCopy.bdg.addAll(bdg);
      proyeccionEspEditCopy.proyectosList.add(proyectosReg);
      proyeccionEspEditCopy.ejecutoresList.add(ejecutoresReg);
    }
    emit(state().copyWith(
      pEdit: proyeccionEspEdit,
      pCopy: proyeccionEspEditCopy,
    ));
  }

  change({
    required String id,
    required int mes,
    required int valor,
  }) {
    ProyeccionEspEdit pCopy = state().pCopy!;
    pCopy.list.firstWhere((e) => e.id == id).setMes(mes, valor);
    ProyeccionEspEdit pEdit = state().pEdit!;
    pEdit.list.firstWhere((e) => e.id == id).setMes(mes, valor);
    emit(state().copyWith(
      pCopy: pCopy,
      pEdit: pEdit,
    ));
  }

  changeContract({
    required String id,
    required String valor,
  }) {
    ProyeccionEspEdit pCopy = state().pCopy!;
    pCopy.list.firstWhere((e) => e.id == id).contrato = valor;
    ProyeccionEspEdit pEdit = state().pEdit!;
    pEdit.list.firstWhere((e) => e.id == id).contrato = valor;
    emit(state().copyWith(
      pCopy: pCopy,
      pEdit: pEdit,
    ));
  }

  get save async {
    bl.startLoading;
    ProyeccionEspEdit pCopy = state().pCopy!;
    List<ProyeccionRegEsp> list = pCopy.list;
    List<ProyeccionRegEsp> original = pCopy.original;
    List<ProyeccionRegEsp> cambios = [];
    for (int i = 0; i < list.length; i++) {
      ProyeccionRegEsp reg = list[i];
      ProyeccionRegEsp regOriginal = original[i];
      if (reg != regOriginal) {
        cambios.add(reg);
        reg.modificadopersona = state().user?.correo ?? "Error";
        reg.modificadofecha = DateTime.now().toString();
        reg.revisado = true.toString();
        reg.revisadopor = state().user?.correo ?? "Error";
        reg.revisadofecha = DateTime.now().toString();
      }
    }

    String year = state().year;
    // print('cambios.length ${cambios.length}');
    Map<String, Object> dataSend = {
      'info': {
        'libro': 'PROYECCION_$year',
        'hoja': 'reg',
        'data': cambios.map((e) => e.toMap()).toList(),
      },
      'fname': "update"
    };

    print(jsonEncode(dataSend));

    try {
      final Response response = await post(
        Uri.parse(ApiUrl.costi),
        body: jsonEncode(dataSend),
      );
      add(Load());
      await Future.delayed(const Duration(seconds: 3));
      bl.mensajeFlotante(message: jsonDecode(response.body).toString());
    } catch (e) {
      bl.errorCarga("Envío Cambios Proyeccion", e);
      bl.stopLoading;
    }
  }
}

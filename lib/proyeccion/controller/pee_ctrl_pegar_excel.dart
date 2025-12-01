import 'package:flutter/services.dart';

import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../resources/a_entero_2.dart';
import '../model/proyeccion_esp_edit.dart';
import '../model/proyeccion_reg_esp.dart';

class CtrlPeePegarExcel {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;

  CtrlPeePegarExcel(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  Future<bool> get seLogroPegar async {
    final clipboardData = await Clipboard.getData('text/plain');
    String? data = clipboardData?.text;
    if (data == null) return false;
    if (data.isEmpty) return false;
    bool tieneFormato = data.toLowerCase().startsWith('id');
    if (!tieneFormato) return false;
    final rows = data.split('\n').map((e) => e.trim()).toList();
    rows.removeWhere((e) => e.isEmpty);
    if (rows.length < 2) return false;
    int columnas = rows[0].split('\t').length;
    if (columnas != 19) return false;
    ProyeccionEspEdit pEdit = state().pEdit ?? ProyeccionEspEdit();
    // ProyeccionEspEdit pCopy = state().pCopy ?? ProyeccionEspEdit();
    // emit(state().copyWith(pEdit: pEdit));
    List<ProyeccionRegEsp> list = pEdit.list;
    // List<ProyeccionRegEsp> listCopy = pCopy.list;
    for (int i = 1; i < rows.length; i++) {
      String row = rows[i];
      final values = row.split('\t').map((e) => e.trim()).toList();
      for (int j = 0; j < list.length; j++) {
        ProyeccionRegEsp reg = list[j];
        // ProyeccionRegEsp regCopy = listCopy[j];
        if (reg.id == values[0].toString()) {
          reg.contrato = values[5].toString();
          if (values.length == 19) reg.comentario = values[18].toString();
          for (int k in List.generate(12, (k) => k + 1)) {
            reg.setMes(k, aEntero(values[5 + k].toString()));
          }
          break;
        }
        // if (regCopy.id == values[0].toString()) {
        //   for (int k in List.generate(12, (k) => k + 1)) {
        //     regCopy.setMes(k, aEntero(values[4 + k].toString()));
        //   }
        //   break;
        // }
      }
    }
    ProyeccionEspEdit pCopy = state().pCopy ?? ProyeccionEspEdit();
    pCopy.list.clear();
    pCopy.list = [];
    pCopy.list = pEdit.list.map((e) => e.copyWith()).toList();
    emit(state().copyWith(
      pEdit: pEdit,
      pCopy: pCopy,
    ));
    return true;
  }
}

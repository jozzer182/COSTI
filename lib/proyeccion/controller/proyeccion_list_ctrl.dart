import 'dart:convert';

import 'package:costii/proyeccion/model/proyeccion_reg_esp.dart';
import 'package:http/http.dart';

import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../resources/a_entero_2.dart';
import '../../resources/constants/url.dart';
import '../../resources/constants/years.dart';
import '../../resources/future_group_add.dart';
import '../model/proyeccion_list.dart';
import '../model/proyeccion_reg.dart';

class ProyeccionListController {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;
  ProyeccionList proyeccionListInit = ProyeccionList();

  ProyeccionListController(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  get obtener async {
    FutureGroupDelayed futureG = FutureGroupDelayed();
    for (String year in years) {
      futureG.addF(_llamada(year));
    }
    futureG.close();
    await futureG.future;
    emit(state().copyWith(proyeccionList: proyeccionListInit));
    print("PROYECCION: ${proyeccionListInit.list.length}");
  }

  _llamada(String year) async {
    try {
      // LclPosList initLclFechaList = LclPosList();
      Map<String, Object> dataSend = {
        'info': {
          'libro': 'PROYECCION_$year',
          'hoja': 'reg',
        },
        'fname': "getHoja"
      };
      // print(jsonEncode(dataSend));
      final Response response = await post(
        Uri.parse(ApiUrl.costi),
        body: jsonEncode(dataSend),
      );
      var dataAsListMap = jsonDecode(response.body);
      if (dataAsListMap is List && dataAsListMap.isNotEmpty) {
        proyeccionListInit.listEsp.addAll(
          dataAsListMap
              .map(
                (e) => ProyeccionRegEsp.fromMap(e)..year = aEntero(year),
              )
              .toList(),
        );
      }

      for (ProyeccionRegEsp reg in proyeccionListInit.listEsp) {
        if (proyeccionListInit.list
            .where(
              (e) => e.idproy == reg.idproy && e.naturaleza == reg.naturaleza,
            )
            .isEmpty) {
          proyeccionListInit.list.add(
            ProyeccionReg.fromEsp(reg),
          );
        }

        ProyeccionReg proyeccionReg = proyeccionListInit.list.firstWhere(
          (e) => e.idproy == reg.idproy && e.naturaleza == reg.naturaleza,
        );
        proyeccionReg.m01 += reg.m01;
        proyeccionReg.m02 += reg.m02;
        proyeccionReg.m03 += reg.m03;
        proyeccionReg.m04 += reg.m04;
        proyeccionReg.m05 += reg.m05;
        proyeccionReg.m06 += reg.m06;
        proyeccionReg.m07 += reg.m07;
        proyeccionReg.m08 += reg.m08;
        proyeccionReg.m09 += reg.m09;
        proyeccionReg.m10 += reg.m10;
        proyeccionReg.m11 += reg.m11;
        proyeccionReg.m12 += reg.m12;
        // proyeccionListInit.list.add(proyeccionReg);
      }
      // emit(state().copyWith(lclPosList: lclPosList));
      // print("LCLS: ${lclPosList.list}");
    } catch (e) {
      bl.errorCarga("PROYECCION_$year", e);
    }
  }
}

import 'dart:convert';

import 'package:costii/real/model/real_list.dart';
import 'package:costii/real/model/real_reg.dart';
import 'package:costii/real/model/rel_year_reg.dart';
import 'package:costii/resources/constants/url.dart';
import 'package:costii/resources/constants/years.dart';
import 'package:http/http.dart';

import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../resources/future_group_add.dart';

class RealListController {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;
  RealList realListInit = RealList();

  RealListController(this.bl) {
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
    realListInit.list.sort((a, b) =>
        ('${a.nomproyecto}${a.mes}').compareTo('${b.nomproyecto}${b.mes}'));

    for (RealReg reg in realListInit.list) {
      if (realListInit.listYear
          .where((e) =>
              e.nomproyecto == reg.nomproyecto &&
              e.naturaleza == reg.naturaleza)
          .isEmpty) {
        realListInit.listYear.add(
          RealYearReg.fromRealReg(reg)..year = reg.year,
        );
      }
      RealYearReg yearReg = realListInit.listYear.firstWhere(
        (e) =>
            e.nomproyecto == reg.nomproyecto && e.naturaleza == reg.naturaleza,
        // orElse: () => BdgYearReg(),
      );
      if (reg.mes.startsWith('01')) yearReg.m01 += reg.valormonedaobjeto;
      if (reg.mes.startsWith('02')) yearReg.m02 += reg.valormonedaobjeto;
      if (reg.mes.startsWith('03')) yearReg.m03 += reg.valormonedaobjeto;
      if (reg.mes.startsWith('04')) yearReg.m04 += reg.valormonedaobjeto;
      if (reg.mes.startsWith('05')) yearReg.m05 += reg.valormonedaobjeto;
      if (reg.mes.startsWith('06')) yearReg.m06 += reg.valormonedaobjeto;
      if (reg.mes.startsWith('07')) yearReg.m07 += reg.valormonedaobjeto;
      if (reg.mes.startsWith('08')) yearReg.m08 += reg.valormonedaobjeto;
      if (reg.mes.startsWith('09')) yearReg.m09 += reg.valormonedaobjeto;
      if (reg.mes.startsWith('10')) yearReg.m10 += reg.valormonedaobjeto;
      if (reg.mes.startsWith('11')) yearReg.m11 += reg.valormonedaobjeto;
      if (reg.mes.startsWith('12')) yearReg.m12 += reg.valormonedaobjeto;
      yearReg.total += reg.valormonedaobjeto;
    }

    emit(state().copyWith(realList: realListInit));
    // print("BdgListController: ${realListInit.list.length}");
    // print("BdgListControllerYear: ${realListInit.listYear.length}");
  }

  _llamada(String year) async {
    try {
      // LclPosList initLclFechaList = LclPosList();
      Map<String, Object> dataSend = {
        'info': {
          'libro': 'REAL_$year',
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
        realListInit.list.addAll(dataAsListMap
            .map(
              (e) => RealReg.fromMap(e)..year = year,
            )
            .toList());
      }
      // emit(state().copyWith(lclPosList: lclPosList));
      // print("LCLS: ${lclPosList.list}");
    } catch (e) {
      bl.errorCarga("REAL_$year", e);
    }
  }
}

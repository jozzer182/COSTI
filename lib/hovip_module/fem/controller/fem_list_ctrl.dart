import 'dart:convert';

import 'package:costii/hovip_module/fem/model/fem_list_model.dart';
import 'package:http/http.dart';

import '../../../bloc/main__bl.dart';
import '../../../bloc/main_bloc.dart';
import '../../../resources/env_config.dart';
import '../../../resources/future_group_add.dart';
import '../model/fem_reg_model.dart';

class FemListController {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;

  FemListController(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  get obtener async {
    MainState Function() state = bl.state;
    bl.startLoading;
    FemList femList = FemList();
    // emit(state().copyWith(fichas: fichas));
    FutureGroupDelayed futureGroupFEM = FutureGroupDelayed();

    List<String> years = ["2024", "2025", "2026", "2027", "2028"];
    for (String year in years) {
      futureGroupFEM.addF(_obtenerFicha(year, femList, bl));
    }
    futureGroupFEM.close();
    try {
      await futureGroupFEM.future.whenComplete(() {
        emit(state().copyWith(femList: femList));
      });
      print("femList!.list: ${state().femList!.list.length}");
    } catch (e) {
      bl.errorCarga("Fichas", e);
    }
    bl.stopLoading;
  }

  Future _obtenerFicha(
    String year,
    FemList fichas,
    Bl bl,
  ) async {
    try {
      var dataSend = {
        'dataReq': {'libro': 'f$year', 'hoja': 'reg'},
        'fname': "getHojaList"
      };
      final response = await post(
        Uri.parse(EnvConfig.apiFem),
        body: jsonEncode(dataSend),
      );
      var dataAsListMap = jsonDecode(response.body);
      List<FemReg> ficha = fichas.list;

      for (List item in dataAsListMap.sublist(1)) {
        ficha.add(FemReg.fromList(item)..year = year);
      }
    } catch (e) {
      bl.errorCarga('FEM ficha del $year', e);
    }
  }
}

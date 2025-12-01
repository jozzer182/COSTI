import 'dart:convert';

import 'package:costii/hovip_module/proyectos/model/proyectos_list.dart';
import 'package:costii/hovip_module/proyectos/model/proyectos_reg.dart';
import 'package:http/http.dart';

import '../../../bloc/main__bl.dart';
import '../../../bloc/main_bloc.dart';
import '../../../resources/constants/url.dart';

class ProyectosListController {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;

  ProyectosListController(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  get obtener async {
    ProyectosList proyectosList = ProyectosList();
    try {
      // LclPosList initLclFechaList = LclPosList();
      Map<String, Object> dataSend = {
        "info": {"libro": "PROYECTOS", "hoja": "reg"},
        "fname": "getHoja"
      };
      // print(jsonEncode(dataSend));
      final Response response = await post(
        Uri.parse(ApiUrl.hovip),
        body: jsonEncode(dataSend),
      );
      var dataAsListMap = jsonDecode(response.body);
      if (dataAsListMap is List && dataAsListMap.isNotEmpty) {
        proyectosList.list.addAll(dataAsListMap
            .map(
              (e) => ProyectosReg.fromMap(e),
            )
            .toList());
      }
      emit(state().copyWith(proyectosList: proyectosList));
      print("Proyectos: ${proyectosList.list.length}");
    } catch (e) {
      bl.errorCarga("PROYECTOS", e);
    }
  }
}

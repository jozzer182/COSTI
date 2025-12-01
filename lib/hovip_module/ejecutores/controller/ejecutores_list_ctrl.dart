import 'dart:convert';

import 'package:http/http.dart';

import '../../../bloc/main__bl.dart';
import '../../../bloc/main_bloc.dart';
import '../../../resources/constants/url.dart';
import '../model/ejecutores_list_model.dart';
import '../model/ejecutores_reg_model.dart';

class EjecutoresListController {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;

  EjecutoresListController(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  get obtener async {
    EjecutoresList ejecutoresList = EjecutoresList();
    try {
      // LclPosList initLclFechaList = LclPosList();
      Map<String, Object> dataSend = {
        "info": {"libro": "EJECUTORES", "hoja": "reg"},
        "fname": "getHoja"
      };
      // print(jsonEncode(dataSend));
      final Response response = await post(
        Uri.parse(ApiUrl.hovip),
        body: jsonEncode(dataSend),
      );
      var dataAsListMap = jsonDecode(response.body);
      if (dataAsListMap is List && dataAsListMap.isNotEmpty) {
        ejecutoresList.list.addAll(dataAsListMap
            .map(
              (e) => EjecutoresReg.fromMap(e),
            )
            .toList());
      }
      emit(state().copyWith(ejecutoresList: ejecutoresList));
      print("Ejecutores: ${ejecutoresList.list.length}");
    } catch (e) {
      bl.errorCarga("EJECUTORES", e);
    }
  }

}

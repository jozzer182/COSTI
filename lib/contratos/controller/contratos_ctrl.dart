import 'dart:convert';

import 'package:costii/contratos/model/contratos_list.dart';
import 'package:costii/contratos/model/contratos_reg.dart';
import 'package:http/http.dart';

import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';
import '../../resources/constants/url.dart';

class ContratosListController {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;

  ContratosListController(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  get obtener async {
    try {
      ContratosList contratosList = ContratosList();
      Map<String, Object> dataSend = {
        'info': {
          'libro': 'CONTRATOS',
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
        contratosList.list.addAll(dataAsListMap
            .map(
              (e) => ContratosReg.fromMap(e),
            )
            .toList());
      }
      emit(state().copyWith(contratosList: contratosList));
      print("contratosList: ${contratosList.list.length}");
    } catch (e) {
      bl.errorCarga("contratosList", e);
    }
  }
}

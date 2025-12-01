import 'dart:convert';

import 'package:http/http.dart';

import '../../../bloc/main__bl.dart';
import '../../../bloc/main_bloc.dart';
import '../../../resources/constants/url.dart';
import '../model/sustitutos_list.dart';
import '../model/sustitutos_reg.dart';

class SustitutosListCtrl {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;

  SustitutosListCtrl(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  get obtener async {
    SustitutosList sustitutosList = SustitutosList();
    try {
      // LclPosList initLclFechaList = LclPosList();
      Map<String, Object> dataSend = {
        "info": {"libro": "SUSTITUTOS", "hoja": "reg"},
        "fname": "getHoja"
      };
      // print(jsonEncode(dataSend));
      final Response response = await post(
        Uri.parse(ApiUrl.hovip),
        body: jsonEncode(dataSend),
      );
      var dataAsListMap = jsonDecode(response.body);
      if (dataAsListMap is List && dataAsListMap.isNotEmpty) {
        sustitutosList.list.addAll(dataAsListMap
            .map(
              (e) => SustitutosReg.fromMap(e),
            )
            .toList());
      }
      emit(state().copyWith(sustitutosList: sustitutosList));
      print("sustitutosList: ${sustitutosList.list.length}");
    } catch (e) {
      bl.errorCarga("SUSTITUTOS", e);
    }
  }
}

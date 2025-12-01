import 'dart:convert';

import 'package:costii/bdg/model/bdg_list.dart';
import 'package:costii/bdg/model/bdg_reg.dart';
import 'package:costii/resources/constants/url.dart';
import 'package:http/http.dart';

import '../../bloc/main__bl.dart';
import '../../bloc/main_bloc.dart';

class BdgListController {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;
  BdgList bdgListInit = BdgList();

  BdgListController(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  get obtener async {
    int year = DateTime.now().year;
    try {
      BdgList bdgList = BdgList();
      Map<String, Object> dataSend = {
        'info': {
          'libro': 'BUDGET_$year',
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
        bdgList.list.addAll(dataAsListMap
            .map(
              (e) => BdgReg.fromMap(e)..year = year,
            )
            .toList());
      }
      emit(state().copyWith(bdgList: bdgList));
      print("BDG $year: ${bdgList.list.length}");
    } catch (e) {
      bl.errorCarga("BUDGET_$year", e);
    }
  }

  }

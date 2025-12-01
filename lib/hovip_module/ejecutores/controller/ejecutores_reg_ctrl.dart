import 'dart:convert';

import 'package:costii/hovip_module/ejecutores/model/ejecutores_reg_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../bloc/main__bl.dart';
import '../../../bloc/main_bloc.dart';
import '../../../resources/constants/url.dart';

class EjecutoresRegController {
  final Bl bl;
  late MainState Function() state;
  late var emit;
  late void Function(MainEvent p1) add;

  EjecutoresRegController(this.bl) {
    emit = bl.emit;
    state = bl.state;
    add = bl.add;
  }

  updateReg({
    required EjecutoresReg nuevo,
    required EjecutoresReg historico,
  }) async {
    print('nuevo: $nuevo');
    print('historico: $historico');
    try {
      bl.startLoading;
      Map<String, Object> dataSend = {
        "info": {
          "nuevo": nuevo.toMap(),
          "viejo": historico.toMap(),
        },
        "fname": "cambioEjecutor"
      };
      print(jsonEncode(dataSend));
      final Response response = await post(
        Uri.parse(ApiUrl.hovip),
        body: jsonEncode(dataSend),
      );
      var dataAsListMap = jsonDecode(response.body);
      bl.mensaje(
        message: dataAsListMap.toString(),
        messageColor: Colors.green,
      );
      Future.delayed(
        const Duration(seconds: 2),
      );
      add(Load());
      // print("Ejecutores: ${ejecutoresList.list.length}");
    } catch (e) {
      bl.errorCarga("EJECUTORES", e);
    }
    bl.stopLoading;
  }
}

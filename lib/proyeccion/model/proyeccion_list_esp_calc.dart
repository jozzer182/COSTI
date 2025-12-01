import 'proyeccion_esp_edit.dart';
import 'proyeccion_reg_esp.dart';

class ProyeccionListEspCalcModel {
  late ProyeccionEspEdit proyeccionList;
  ProyeccionListEspCalcModel(
    this.proyeccionList,
  );

  int m01Acum(List<ProyeccionRegEsp> list) {
    return list.fold(0, (p, e) => p + e.m01Acum);
  }

  int m02Acum(List<ProyeccionRegEsp> list) {
    return list.fold(0, (p, e) => p + e.m02Acum);
  }

  int m03Acum(List<ProyeccionRegEsp> list) {
    return list.fold(0, (p, e) => p + e.m03Acum);
  }

  int m04Acum(List<ProyeccionRegEsp> list) {
    return list.fold(0, (p, e) => p + e.m04Acum);
  }

  int m05Acum(List<ProyeccionRegEsp> list) {
    return list.fold(0, (p, e) => p + e.m05Acum);
  }

  int m06Acum(List<ProyeccionRegEsp> list) {
    return list.fold(0, (p, e) => p + e.m06Acum);
  }

  int m07Acum(List<ProyeccionRegEsp> list) {
    return list.fold(0, (p, e) => p + e.m07Acum);
  }

  int m08Acum(List<ProyeccionRegEsp> list) {
    return list.fold(0, (p, e) => p + e.m08Acum);
  }

  int m09Acum(List<ProyeccionRegEsp> list) {
    return list.fold(0, (p, e) => p + e.m09Acum);
  }

  int m10Acum(List<ProyeccionRegEsp> list) {
    return list.fold(0, (p, e) => p + e.m10Acum);
  }

  int m11Acum(List<ProyeccionRegEsp> list) {
    return list.fold(0, (p, e) => p + e.m11Acum);
  }

  int m12Acum(List<ProyeccionRegEsp> list) {
    return list.fold(0, (p, e) => p + e.m12Acum);
  }

  Map<int, int> mAcum(List<ProyeccionRegEsp> list) {
    return {
      1: m01Acum(list),
      2: m02Acum(list),
      3: m03Acum(list),
      4: m04Acum(list),
      5: m05Acum(list),
      6: m06Acum(list),
      7: m07Acum(list),
      8: m08Acum(list),
      9: m09Acum(list),
      10: m10Acum(list),
      11: m11Acum(list),
      12: m12Acum(list),
    };
  }

  bool get hayCambios {
    List<ProyeccionRegEsp> list = proyeccionList.list;
    List<ProyeccionRegEsp> original = proyeccionList.original;
    List<ProyeccionRegEsp> cambios = [];
    for (int i = 0; i < list.length; i++) {
      ProyeccionRegEsp reg = list[i];
      ProyeccionRegEsp regOriginal = original[i];
      if (reg != regOriginal) {
        cambios.add(reg);
      }
    }
    // print('cambios.length ${cambios.length}');
    return cambios.isNotEmpty;
  }
}

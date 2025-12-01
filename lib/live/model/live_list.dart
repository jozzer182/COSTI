import '../../resources/titulo.dart';
import 'live_reg.dart';

class LiveList {
  List<LiveReg> list = [];
  List<ToCelda> celdas = [
    ToCelda(valor: 'Proyecto', flex: 7),
    ToCelda(valor: 'Naturaleza', flex: 2),
    ToCelda(valor: 'Revisado', flex: 2),
    ToCelda(valor: "01", flex: 2),
    ToCelda(valor: "02", flex: 2),
    ToCelda(valor: "03", flex: 2),
    ToCelda(valor: "04", flex: 2),
    ToCelda(valor: "05", flex: 2),
    ToCelda(valor: "06", flex: 2),
    ToCelda(valor: "07", flex: 2),
    ToCelda(valor: "08", flex: 2),
    ToCelda(valor: "09", flex: 2),
    ToCelda(valor: "10", flex: 2),
    ToCelda(valor: "11", flex: 2),
    ToCelda(valor: "12", flex: 2),
    ToCelda(valor: "Total", flex: 2),
  ];

  // int get totalBDGCUS = 

  int m01Acum(List<LiveReg> list) {
    return list.fold(0, (p, e) => p + e.m01Acum);
  }
  int m02Acum(List<LiveReg> list) {
    return list.fold(0, (p, e) => p + e.m02Acum);
  }
  int m03Acum(List<LiveReg> list) {
    return list.fold(0, (p, e) => p + e.m03Acum);
  }
  int m04Acum(List<LiveReg> list) {
    return list.fold(0, (p, e) => p + e.m04Acum);
  }
  int m05Acum(List<LiveReg> list) {
    return list.fold(0, (p, e) => p + e.m05Acum);
  }
  int m06Acum(List<LiveReg> list) {
    return list.fold(0, (p, e) => p + e.m06Acum);
  }
  int m07Acum(List<LiveReg> list) {
    return list.fold(0, (p, e) => p + e.m07Acum);
  }
  int m08Acum(List<LiveReg> list) {
    return list.fold(0, (p, e) => p + e.m08Acum);
  }
  int m09Acum(List<LiveReg> list) {
    return list.fold(0, (p, e) => p + e.m09Acum);
  }
  int m10Acum(List<LiveReg> list) {
    return list.fold(0, (p, e) => p + e.m10Acum);
  }
  int m11Acum(List<LiveReg> list) {
    return list.fold(0, (p, e) => p + e.m11Acum);
  }
  int m12Acum(List<LiveReg> list) {
    return list.fold(0, (p, e) => p + e.m12Acum);
  }
  Map<int,int> mAcum(List<LiveReg> list) {
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

  int m01AcumBDG(List<LiveReg> list) {
    return list.fold(0, (p, e) => p + e.bdg.m01Acum);
  }
  int m02AcumBDG(List<LiveReg> list) {
    return list.fold(0, (p, e) => p + e.bdg.m02Acum);
  }
  int m03AcumBDG(List<LiveReg> list) {
    return list.fold(0, (p, e) => p + e.bdg.m03Acum);
  }
  int m04AcumBDG(List<LiveReg> list) {
    return list.fold(0, (p, e) => p + e.bdg.m04Acum);
  }
  int m05AcumBDG(List<LiveReg> list) {
    return list.fold(0, (p, e) => p + e.bdg.m05Acum);
  }
  int m06AcumBDG(List<LiveReg> list) {
    return list.fold(0, (p, e) => p + e.bdg.m06Acum);
  }
  int m07AcumBDG(List<LiveReg> list) {
    return list.fold(0, (p, e) => p + e.bdg.m07Acum);
  }
  int m08AcumBDG(List<LiveReg> list) {
    return list.fold(0, (p, e) => p + e.bdg.m08Acum);
  }
  int m09AcumBDG(List<LiveReg> list) {
    return list.fold(0, (p, e) => p + e.bdg.m09Acum);
  }
  int m10AcumBDG(List<LiveReg> list) {
    return list.fold(0, (p, e) => p + e.bdg.m10Acum);
  }
  int m11AcumBDG(List<LiveReg> list) {
    return list.fold(0, (p, e) => p + e.bdg.m11Acum);
  }
  int m12AcumBDG(List<LiveReg> list) {
    return list.fold(0, (p, e) => p + e.bdg.m12Acum);
  }
  Map<int,int> mAcumBDG(List<LiveReg> list) {
    return {
      1: m01AcumBDG(list),
      2: m02AcumBDG(list),
      3: m03AcumBDG(list),
      4: m04AcumBDG(list),
      5: m05AcumBDG(list),
      6: m06AcumBDG(list),
      7: m07AcumBDG(list),
      8: m08AcumBDG(list),
      9: m09AcumBDG(list),
      10: m10AcumBDG(list),
      11: m11AcumBDG(list),
      12: m12AcumBDG(list),
    };
  }
}

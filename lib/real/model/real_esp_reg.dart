import 'real_reg.dart';

class RealEspReg {
  List<RealReg> list = [];
  String especialidad = '';
  int get total => list.fold(0, (p, a) => p + a.valormonedaobjeto.toInt());
  int mes(int mes) {
    if (list.isEmpty) return 0;
    List<RealReg> mesList = [];
    if (mes == 1) mesList = list.where((e) => e.mes.startsWith('01')).toList();
    if (mes == 2) mesList = list.where((e) => e.mes.startsWith('02')).toList();
    if (mes == 3) mesList = list.where((e) => e.mes.startsWith('03')).toList();
    if (mes == 4) mesList = list.where((e) => e.mes.startsWith('04')).toList();
    if (mes == 5) mesList = list.where((e) => e.mes.startsWith('05')).toList();
    if (mes == 6) mesList = list.where((e) => e.mes.startsWith('06')).toList();
    if (mes == 7) mesList = list.where((e) => e.mes.startsWith('07')).toList();
    if (mes == 8) mesList = list.where((e) => e.mes.startsWith('08')).toList();
    if (mes == 9) mesList = list.where((e) => e.mes.startsWith('09')).toList();
    if (mes == 10) mesList = list.where((e) => e.mes.startsWith('10')).toList();
    if (mes == 11) mesList = list.where((e) => e.mes.startsWith('11')).toList();
    if (mes == 12) mesList = list.where((e) => e.mes.startsWith('12')).toList();
    if (mesList.isNotEmpty) {
      return mesList.fold(0, (p, a) => p + a.valormonedaobjeto.toInt());
    }
    return 0;
  }
}

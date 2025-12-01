import 'dart:convert';

import 'package:costii/resources/a_entero_2.dart';
import 'package:costii/resources/toCurrency.dart';

import '../../resources/titulo.dart';
import 'proyeccion_reg_esp.dart';

class ProyeccionReg {
  String id;
  String idproy;
  String proyecto;
  String naturaleza;
  int m01;
  int m02;
  int m03;
  int m04;
  int m05;
  int m06;
  int m07;
  int m08;
  int m09;
  int m10;
  int m11;
  int m12;
  int year = 1990;
  ProyeccionReg({
    required this.id,
    required this.idproy,
    required this.proyecto,
    required this.naturaleza,
    required this.m01,
    required this.m02,
    required this.m03,
    required this.m04,
    required this.m05,
    required this.m06,
    required this.m07,
    required this.m08,
    required this.m09,
    required this.m10,
    required this.m11,
    required this.m12,
  });

  List<String> toList() {
    return [
      id,
      idproy,
      proyecto,
      naturaleza,
      m01.toString(),
      m02.toString(),
      m03.toString(),
      m04.toString(),
      m05.toString(),
      m06.toString(),
      m07.toString(),
      m08.toString(),
      m09.toString(),
      m10.toString(),
      m11.toString(),
      m12.toString(),
    ];
  }

  ProyeccionReg copyWith({
    String? id,
    String? idproy,
    String? proyecto,
    String? naturaleza,
    int? m01,
    int? m02,
    int? m03,
    int? m04,
    int? m05,
    int? m06,
    int? m07,
    int? m08,
    int? m09,
    int? m10,
    int? m11,
    int? m12,
  }) {
    return ProyeccionReg(
      id: id ?? this.id,
      idproy: idproy ?? this.idproy,
      proyecto: proyecto ?? this.proyecto,
      naturaleza: naturaleza ?? this.naturaleza,
      m01: m01 ?? this.m01,
      m02: m02 ?? this.m02,
      m03: m03 ?? this.m03,
      m04: m04 ?? this.m04,
      m05: m05 ?? this.m05,
      m06: m06 ?? this.m06,
      m07: m07 ?? this.m07,
      m08: m08 ?? this.m08,
      m09: m09 ?? this.m09,
      m10: m10 ?? this.m10,
      m11: m11 ?? this.m11,
      m12: m12 ?? this.m12,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idproy': idproy,
      'proyecto': proyecto,
      'naturaleza': naturaleza,
      'm01': m01,
      'm02': m02,
      'm03': m03,
      'm04': m04,
      'm05': m05,
      'm06': m06,
      'm07': m07,
      'm08': m08,
      'm09': m09,
      'm10': m10,
      'm11': m11,
      'm12': m12,
    };
  }

  factory ProyeccionReg.fromMap(Map<String, dynamic> map) {
    return ProyeccionReg(
      id: map['id'].toString(),
      idproy: map['idproy'].toString(),
      proyecto: map['proyecto'].toString(),
      naturaleza: map['naturaleza'].toString(),
      m01: aEntero(map['m01'].toString()),
      m02: aEntero(map['m02'].toString()),
      m03: aEntero(map['m03'].toString()),
      m04: aEntero(map['m04'].toString()),
      m05: aEntero(map['m05'].toString()),
      m06: aEntero(map['m06'].toString()),
      m07: aEntero(map['m07'].toString()),
      m08: aEntero(map['m08'].toString()),
      m09: aEntero(map['m09'].toString()),
      m10: aEntero(map['m10'].toString()),
      m11: aEntero(map['m11'].toString()),
      m12: aEntero(map['m12'].toString()),
    );
  }

  factory ProyeccionReg.fromInit() {
    return ProyeccionReg(
      id: '',
      idproy: '',
      proyecto: '',
      naturaleza: '',
      m01: aEntero(''),
      m02: aEntero(''),
      m03: aEntero(''),
      m04: aEntero(''),
      m05: aEntero(''),
      m06: aEntero(''),
      m07: aEntero(''),
      m08: aEntero(''),
      m09: aEntero(''),
      m10: aEntero(''),
      m11: aEntero(''),
      m12: aEntero(''),
    );
  }

  factory ProyeccionReg.fromEsp(ProyeccionRegEsp reg) {
    return ProyeccionReg(
      id: reg.id,
      idproy: reg.idproy,
      proyecto: reg.proyecto,
      naturaleza: reg.naturaleza,
      m01: 0,
      m02: 0,
      m03: 0,
      m04: 0,
      m05: 0,
      m06: 0,
      m07: 0,
      m08: 0,
      m09: 0,
      m10: 0,
      m11: 0,
      m12: 0,
    )..year = reg.year;
  }

  String toJson() => json.encode(toMap());

  factory ProyeccionReg.fromJson(String source) =>
      ProyeccionReg.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProyeccionReg(id: $id, idproy: $idproy, proyecto: $proyecto, naturaleza: $naturaleza, m01: $m01, m02: $m02, m03: $m03, m04: $m04, m05: $m05, m06: $m06, m07: $m07, m08: $m08, m09: $m09, m10: $m10, m11: $m11, m12: $m12)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProyeccionReg &&
        other.id == id &&
        other.idproy == idproy &&
        other.proyecto == proyecto &&
        other.naturaleza == naturaleza &&
        other.m01 == m01 &&
        other.m02 == m02 &&
        other.m03 == m03 &&
        other.m04 == m04 &&
        other.m05 == m05 &&
        other.m06 == m06 &&
        other.m07 == m07 &&
        other.m08 == m08 &&
        other.m09 == m09 &&
        other.m10 == m10 &&
        other.m11 == m11 &&
        other.m12 == m12;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        idproy.hashCode ^
        proyecto.hashCode ^
        naturaleza.hashCode ^
        m01.hashCode ^
        m02.hashCode ^
        m03.hashCode ^
        m04.hashCode ^
        m05.hashCode ^
        m06.hashCode ^
        m07.hashCode ^
        m08.hashCode ^
        m09.hashCode ^
        m10.hashCode ^
        m11.hashCode ^
        m12.hashCode;
  }

  int get total =>
      m01 + m02 + m03 + m04 + m05 + m06 + m07 + m08 + m09 + m10 + m11 + m12;

  List<ToCelda> get celdas => [
        ToCelda(valor: proyecto, flex: 7),
        ToCelda(valor: naturaleza, flex: 4),
        ToCelda(valor: enMillon1(m01), flex: 2),
        ToCelda(valor: enMillon1(m02), flex: 2),
        ToCelda(valor: enMillon1(m03), flex: 2),
        ToCelda(valor: enMillon1(m04), flex: 2),
        ToCelda(valor: enMillon1(m05), flex: 2),
        ToCelda(valor: enMillon1(m06), flex: 2),
        ToCelda(valor: enMillon1(m07), flex: 2),
        ToCelda(valor: enMillon1(m08), flex: 2),
        ToCelda(valor: enMillon1(m09), flex: 2),
        ToCelda(valor: enMillon1(m10), flex: 2),
        ToCelda(valor: enMillon1(m11), flex: 2),
        ToCelda(valor: enMillon1(m12), flex: 2),
        ToCelda(valor: enMillon1(total), flex: 2),
      ];

  int getByMonth(int month) {
    if (month == 1) return m01.toInt();
    if (month == 2) return m02.toInt();
    if (month == 3) return m03.toInt();
    if (month == 4) return m04.toInt();
    if (month == 5) return m05.toInt();
    if (month == 6) return m06.toInt();
    if (month == 7) return m07.toInt();
    if (month == 8) return m08.toInt();
    if (month == 9) return m09.toInt();
    if (month == 10) return m10.toInt();
    if (month == 11) return m11.toInt();
    if (month == 12) return m12.toInt();
    return 0;
  }

  
}

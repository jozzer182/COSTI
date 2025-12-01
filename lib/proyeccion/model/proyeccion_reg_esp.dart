import 'dart:convert';

import 'package:costii/resources/a_entero_2.dart';
import 'package:costii/resources/toCurrency.dart';

import '../../resources/titulo.dart';

class ProyeccionRegEsp {
  String id;
  String idproy;
  String proyecto;
  String naturaleza;
  String especialidad;
  String contrato;
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
  String comentario;
  String revisado;
  String revisadopor;
  String revisadofecha;
  String modificadofecha;
  String modificadopersona;
  int year = 1990;
  ProyeccionRegEsp({
    required this.id,
    required this.idproy,
    required this.proyecto,
    required this.naturaleza,
    required this.especialidad,
    required this.contrato,
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
    required this.comentario,
    required this.revisado,
    required this.revisadopor,
    required this.revisadofecha,
    required this.modificadofecha,
    required this.modificadopersona,
  });

  List<String> toList() {
    return [
      id,
      idproy,
      proyecto,
      naturaleza,
      especialidad,
      contrato,
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
      comentario,
      revisado,
      revisadopor,
      revisadofecha,
      modificadofecha,
      modificadopersona,
    ];
  }

  ProyeccionRegEsp copyWith({
    String? id,
    String? idproy,
    String? proyecto,
    String? naturaleza,
    String? especialidad,
    String? contrato,
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
    String? comentario,
    String? revisado,
    String? revisadopor,
    String? revisadofecha,
    String? modificadofecha,
    String? modificadopersona,
  }) {
    return ProyeccionRegEsp(
      id: id ?? this.id,
      idproy: idproy ?? this.idproy,
      proyecto: proyecto ?? this.proyecto,
      naturaleza: naturaleza ?? this.naturaleza,
      especialidad: especialidad ?? this.especialidad,
      contrato: contrato ?? this.contrato,
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
      comentario: comentario ?? this.comentario,
      revisado: revisado ?? this.revisado,
      revisadopor: revisadopor ?? this.revisadopor,
      revisadofecha: revisadofecha ?? this.revisadofecha,
      modificadofecha: modificadofecha ?? this.modificadofecha,
      modificadopersona: modificadopersona ?? this.modificadopersona,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idproy': idproy,
      'proyecto': proyecto,
      'naturaleza': naturaleza,
      'especialidad': especialidad,
      'contrato': contrato,
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
      'comentario': comentario,
      'revisado': revisado,
      'revisadopor': revisadopor,
      'revisadofecha': revisadofecha,
      'modificadofecha': modificadofecha,
      'modificadopersona': modificadopersona,
    };
  }

  Map<String, dynamic> toMapPlanilla() {
    return {
      'id': id,
      'idproy': idproy,
      'proyecto': proyecto,
      'naturaleza': naturaleza,
      'especialidad': especialidad,
      'contrato': contrato,
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
      'comentario': comentario,
    };
  }

  factory ProyeccionRegEsp.fromMap(Map<String, dynamic> map) {
    return ProyeccionRegEsp(
      id: map['id'].toString(),
      idproy: map['idproy'].toString(),
      proyecto: map['proyecto'].toString(),
      naturaleza: map['naturaleza'].toString(),
      especialidad: map['especialidad'].toString(),
      contrato: map['contrato'].toString(),
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
      comentario: map['comentario'].toString(),
      revisado: map['revisado'].toString(),
      revisadopor: map['revisadopor'].toString(),
      revisadofecha: map['revisadofecha'].toString(),
      modificadofecha: map['modificadofecha'].toString(),
      modificadopersona: map['modificadopersona'].toString(),
    );
  }

  factory ProyeccionRegEsp.fromInit() {
    return ProyeccionRegEsp(
      id: '',
      idproy: '',
      proyecto: '',
      naturaleza: '',
      especialidad: '',
      contrato: '',
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
      comentario: '',
      revisado: '',
      revisadopor: '',
      revisadofecha: '',
      modificadofecha: '',
      modificadopersona: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProyeccionRegEsp.fromJson(String source) =>
      ProyeccionRegEsp.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProyeccionReg(id: $id, idproy: $idproy, proyecto: $proyecto, naturaleza: $naturaleza, especialidad: $especialidad, m01: $m01, m02: $m02, m03: $m03, m04: $m04, m05: $m05, m06: $m06, m07: $m07, m08: $m08, m09: $m09, m10: $m10, m11: $m11, m12: $m12, comentario: $comentario, revisado: $revisado, revisadopor: $revisadopor, revisadofecha: $revisadofecha, modificadofecha: $modificadofecha, modificadopersona: $modificadopersona)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProyeccionRegEsp &&
        other.id == id &&
        other.idproy == idproy &&
        other.proyecto == proyecto &&
        other.naturaleza == naturaleza &&
        other.especialidad == especialidad &&
        other.contrato == contrato &&
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
        other.m12 == m12 &&
        other.comentario == comentario &&
        other.revisado == revisado &&
        other.revisadopor == revisadopor &&
        other.revisadofecha == revisadofecha &&
        other.modificadofecha == modificadofecha &&
        other.modificadopersona == modificadopersona;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        idproy.hashCode ^
        proyecto.hashCode ^
        naturaleza.hashCode ^
        especialidad.hashCode ^
        contrato.hashCode ^
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
        m12.hashCode ^
        comentario.hashCode ^
        revisado.hashCode ^
        revisadopor.hashCode ^
        revisadofecha.hashCode ^
        modificadofecha.hashCode ^
        modificadopersona.hashCode;
  }

  int get total =>
      m01 + m02 + m03 + m04 + m05 + m06 + m07 + m08 + m09 + m10 + m11 + m12;

  List<ToCelda> get celdas => [
        ToCelda(valor: proyecto, flex: 7),
        ToCelda(valor: naturaleza, flex: 4),
        ToCelda(valor: especialidad, flex: 4),
        ToCelda(valor: contrato, flex: 3),
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

  int get m01Acum => m01;
  int get m02Acum => m01 + m02;
  int get m03Acum => m01 + m02 + m03;
  int get m04Acum => m01 + m02 + m03 + m04;
  int get m05Acum => m01 + m02 + m03 + m04 + m05;
  int get m06Acum => m01 + m02 + m03 + m04 + m05 + m06;
  int get m07Acum => m01 + m02 + m03 + m04 + m05 + m06 + m07;
  int get m08Acum => m01 + m02 + m03 + m04 + m05 + m06 + m07 + m08;
  int get m09Acum => m01 + m02 + m03 + m04 + m05 + m06 + m07 + m08 + m09;
  int get m10Acum => m01 + m02 + m03 + m04 + m05 + m06 + m07 + m08 + m09 + m10;
  int get m11Acum =>
      m01 + m02 + m03 + m04 + m05 + m06 + m07 + m08 + m09 + m10 + m11;
  int get m12Acum =>
      m01 + m02 + m03 + m04 + m05 + m06 + m07 + m08 + m09 + m10 + m11 + m12;

  int mes(int i) {
    if (i == 1) return m01;
    if (i == 2) return m02;
    if (i == 3) return m03;
    if (i == 4) return m04;
    if (i == 5) return m05;
    if (i == 6) return m06;
    if (i == 7) return m07;
    if (i == 8) return m08;
    if (i == 9) return m09;
    if (i == 10) return m10;
    if (i == 11) return m11;
    if (i == 12) return m12;
    if (i == 13) return total;
    return -1;
  }

  void setMes(int i, int valor) {
    if (i == 1) m01 = valor;
    if (i == 2) m02 = valor;
    if (i == 3) m03 = valor;
    if (i == 4) m04 = valor;
    if (i == 5) m05 = valor;
    if (i == 6) m06 = valor;
    if (i == 7) m07 = valor;
    if (i == 8) m08 = valor;
    if (i == 9) m09 = valor;
    if (i == 10) m10 = valor;
    if (i == 11) m11 = valor;
    if (i == 12) m12 = valor;
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';

import '../../resources/titulo.dart';
import '../../resources/to_mcop.dart';
import 'real_reg.dart';

class RealYearReg extends RealReg {
  num m01;
  num m02;
  num m03;
  num m04;
  num m05;
  num m06;
  num m07;
  num m08;
  num m09;
  num m10;
  num m11;
  num m12;
  num total;
  RealYearReg({
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
    required this.total,
    required super.tipo,
    required super.mes,
    required super.clasedeobjeto,
    required super.objeto,
    required super.denominacionobjeto,
    required super.valormonedaobjeto,
    required super.textocabeceradocumento,
    required super.denominacion,
    required super.textopedido,
    required super.definicionproyecto,
    required super.elemento,
    required super.clasecoste,
    required super.descripclasecoste,
    required super.usuario,
    required super.nomusuario,
    required super.clasedocumento,
    required super.proyecto,
    required super.nomproyecto,
    required super.uot,
    required super.macrocatfinal,
    required super.die4e,
    required super.pee4e,
    required super.capexpurposee4e,
    required super.validacione4e,
    required super.naturaleza,
    required super.area,
    required super.documentocompras,
    required super.contratomarco,
    required super.codigoacreedor,
    required super.proveedor,
    required super.circuito,
    required super.ubictecnica,
    required super.zonaut,
    required super.sspd,
    required super.macrocatproyecto,
    required super.capexpurposeproyecto,
    required super.pcluster,
    required super.diproyecto,
    required super.peproyecto,
    required super.localidad,
    required super.ntnominal,
    required super.nt,
    required super.tpsyst,
    required super.parte,
    required super.seccion,
    required super.categoria,
    required super.otroscostos,
    required super.unidad,
    required super.unidadproyecto,
    required super.uotproyecto,
    required super.zonaejecucion,
    required super.anoproyecto,
    required super.rem1,
    required super.rem2,
    required super.concepto,
    required super.bdg,
    required super.bdgacum,
    required super.real,
    required super.fct,
    required super.hoja1proceso,
    required super.ccjustificaciones,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'proyecto': nomproyecto,
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
      'total': total,
    };
  }

  factory RealYearReg.fromInit() {
    return RealYearReg.fromRealReg(RealReg.fromInit());
  }

  factory RealYearReg.fromRealReg(RealReg reg) {
    return RealYearReg(
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
      total: 0,
      tipo: reg.tipo,
      mes: reg.mes,
      clasedeobjeto: reg.clasedeobjeto,
      objeto: reg.objeto,
      denominacionobjeto: reg.denominacionobjeto,
      valormonedaobjeto: reg.valormonedaobjeto,
      textocabeceradocumento: reg.textocabeceradocumento,
      denominacion: reg.denominacion,
      textopedido: reg.textopedido,
      definicionproyecto: reg.definicionproyecto,
      elemento: reg.elemento,
      clasecoste: reg.clasecoste,
      descripclasecoste: reg.descripclasecoste,
      usuario: reg.usuario,
      nomusuario: reg.nomusuario,
      clasedocumento: reg.clasedocumento,
      proyecto: reg.proyecto,
      nomproyecto: reg.nomproyecto,
      uot: reg.uot,
      macrocatfinal: reg.macrocatfinal,
      die4e: reg.die4e,
      pee4e: reg.pee4e,
      capexpurposee4e: reg.capexpurposee4e,
      validacione4e: reg.validacione4e,
      naturaleza: reg.naturaleza,
      area: reg.area,
      documentocompras: reg.documentocompras,
      contratomarco: reg.contratomarco,
      codigoacreedor: reg.codigoacreedor,
      proveedor: reg.proveedor,
      circuito: reg.circuito,
      ubictecnica: reg.ubictecnica,
      zonaut: reg.zonaut,
      sspd: reg.sspd,
      macrocatproyecto: reg.macrocatproyecto,
      capexpurposeproyecto: reg.capexpurposeproyecto,
      pcluster: reg.pcluster,
      diproyecto: reg.diproyecto,
      peproyecto: reg.peproyecto,
      localidad: reg.localidad,
      ntnominal: reg.ntnominal,
      nt: reg.nt,
      tpsyst: reg.tpsyst,
      parte: reg.parte,
      seccion: reg.seccion,
      categoria: reg.categoria,
      otroscostos: reg.otroscostos,
      unidad: reg.unidad,
      unidadproyecto: reg.unidadproyecto,
      uotproyecto: reg.uotproyecto,
      zonaejecucion: reg.zonaejecucion,
      anoproyecto: reg.anoproyecto,
      rem1: reg.rem1,
      rem2: reg.rem2,
      concepto: reg.concepto,
      bdg: reg.bdg,
      bdgacum: reg.bdgacum,
      real: reg.real,
      fct: reg.fct,
      hoja1proceso: reg.hoja1proceso,
      ccjustificaciones: reg.ccjustificaciones,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  // factory BdgYearReg.fromJson(String source) =>
  //     BdgYearReg.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BdgYearReg(m01: $m01, m02: $m02, m03: $m03, m04: $m04, m05: $m05, m06: $m06, m07: $m07, m08: $m08, m09: $m09, m10: $m10, m11: $m11, m12: $m12, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RealYearReg &&
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
        other.total == total;
  }

  @override
  int get hashCode {
    return m01.hashCode ^
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
        total.hashCode;
  }

  colorCelda(num valor) {
    if (valor == 0) {
      return Colors.grey;
    }
    return null;
  }

  @override
  List<ToCelda> get celdas => [
        ToCelda(valor: nomproyecto, flex: 6),
        ToCelda(valor: naturaleza, flex: 4),
        ToCelda(valor: toMCOP(m01.toInt(), 1), flex: 2, color: colorCelda(m01)),
        ToCelda(valor: toMCOP(m02.toInt(), 1), flex: 2, color: colorCelda(m02)),
        ToCelda(valor: toMCOP(m03.toInt(), 1), flex: 2, color: colorCelda(m03)),
        ToCelda(valor: toMCOP(m04.toInt(), 1), flex: 2, color: colorCelda(m04)),
        ToCelda(valor: toMCOP(m05.toInt(), 1), flex: 2, color: colorCelda(m05)),
        ToCelda(valor: toMCOP(m06.toInt(), 1), flex: 2, color: colorCelda(m06)),
        ToCelda(valor: toMCOP(m07.toInt(), 1), flex: 2, color: colorCelda(m07)),
        ToCelda(valor: toMCOP(m08.toInt(), 1), flex: 2, color: colorCelda(m08)),
        ToCelda(valor: toMCOP(m09.toInt(), 1), flex: 2, color: colorCelda(m09)),
        ToCelda(valor: toMCOP(m10.toInt(), 1), flex: 2, color: colorCelda(m10)),
        ToCelda(valor: toMCOP(m11.toInt(), 1), flex: 2, color: colorCelda(m11)),
        ToCelda(valor: toMCOP(m12.toInt(), 1), flex: 2, color: colorCelda(m12)),
        ToCelda(
            valor: toMCOP(total.toInt(), 1), flex: 2, color: colorCelda(total)),
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

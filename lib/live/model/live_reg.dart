import 'package:costii/hovip_module/ejecutores/model/ejecutores_reg_model.dart';
import 'package:costii/hovip_module/proyectos/model/proyectos_reg.dart';
import 'package:costii/proyeccion/model/proyeccion_reg.dart';
import 'package:costii/proyeccion/model/proyeccion_reg_esp.dart';
import 'package:costii/real/model/real_esp_reg.dart';
import 'package:costii/real/model/rel_year_reg.dart';
import 'package:costii/resources/constants/colors_const.dart';
import 'package:costii/resources/toCurrency.dart';
import 'package:costii/resources/to_mcop.dart';
import 'package:flutter/material.dart';

import '../../bdg/model/bdg_reg.dart';
import '../../resources/titulo.dart';

class LiveReg {
  BdgReg bdg = BdgReg.fromInit();
  RealYearReg real = RealYearReg.fromInit();
  ProyeccionReg proyeccion = ProyeccionReg.fromInit();
  List<ProyeccionRegEsp> proyeccionEsp = [];
  ProyectosReg proyectosReg = ProyectosReg.fromInit();
  EjecutoresReg ejecutoresReg = EjecutoresReg.fromInit();
  List<RealEspReg> especialidadList = [];
  String proyecto = "";
  String naturaleza = "";
  String year = "";
  String area = "_";
  int m01 = 0;
  int m02 = 0;
  int m03 = 0;
  int m04 = 0;
  int m05 = 0;
  int m06 = 0;
  int m07 = 0;
  int m08 = 0;
  int m09 = 0;
  int m10 = 0;
  int m11 = 0;
  int m12 = 0;
  String get check => proyeccionEsp.any((e) => e.revisado.toUpperCase() == 'TRUE').toString();

  bool m01Active = false;
  bool m02Active = false;
  bool m03Active = false;
  bool m04Active = false;
  bool m05Active = false;
  bool m06Active = false;
  bool m07Active = false;
  bool m08Active = false;
  bool m09Active = false;
  bool m10Active = false;
  bool m11Active = false;
  bool m12Active = false;

  List<String> toList() {
    return [
      proyecto,
      area,
      naturaleza,
      ...bdg.toList(),
      ...real.toList(),
      ...proyeccion.toList(),
      ...proyectosReg.toList(),
      ...ejecutoresReg.toList(),
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      'year': year,
      'area': area,
      'proyecto': proyecto,
      'pm': ejecutoresReg.pm,
      'macro': proyectosReg.macroc,
      'naturaleza': naturaleza,
      'especialidades': especialidadList.length,
      'check': check,
      'm01real': real.m01,
      'm02real': real.m02,
      'm03real': real.m03,
      'm04real': real.m04,
      'm05real': real.m05,
      'm06real': real.m06,
      'm07real': real.m07,
      'm08real': real.m08,
      'm09real': real.m09,
      'm10real': real.m10,
      'm11real': real.m11,
      'm12real': real.m12,
      'm01proy': proyeccion.m01,
      'm02proy': proyeccion.m02,
      'm03proy': proyeccion.m03,
      'm04proy': proyeccion.m04,
      'm05proy': proyeccion.m05,
      'm06proy': proyeccion.m06,
      'm07proy': proyeccion.m07,
      'm08proy': proyeccion.m08,
      'm09proy': proyeccion.m09,
      'm10proy': proyeccion.m10,
      'm11proy': proyeccion.m11,
      'm12proy': proyeccion.m12,
      'm01bdg': bdg.m01,
      'm02bdg': bdg.m02,
      'm03bdg': bdg.m03,
      'm04bdg': bdg.m04,
      'm05bdg': bdg.m05,
      'm06bdg': bdg.m06,
      'm07bdg': bdg.m07,
      'm08bdg': bdg.m08,
      'm09bdg': bdg.m09,
      'm10bdg': bdg.m10,
      'm11bdg': bdg.m11,
      'm12bdg': bdg.m12,
    };
  }

  void setByMonth(int month, bool active, int value) {
    if (month == 1) {
      m01 = value;
      m01Active = active;
    }
    if (month == 2) {
      m02 = value;
      m02Active = active;
    }
    if (month == 3) {
      m03 = value;
      m03Active = active;
    }
    if (month == 4) {
      m04 = value;
      m04Active = active;
    }
    if (month == 5) {
      m05 = value;
      m05Active = active;
    }
    if (month == 6) {
      m06 = value;
      m06Active = active;
    }
    if (month == 7) {
      m07 = value;
      m07Active = active;
    }
    if (month == 8) {
      m08 = value;
      m08Active = active;
    }
    if (month == 9) {
      m09 = value;
      m09Active = active;
    }
    if (month == 10) {
      m10 = value;
      m10Active = active;
    }
    if (month == 11) {
      m11 = value;
      m11Active = active;
    }
    if (month == 12) {
      m12 = value;
      m12Active = active;
    }
  }

  bool getActiveByMonth(int month) {
    if (month == 1) return m01Active;
    if (month == 2) return m02Active;
    if (month == 3) return m03Active;
    if (month == 4) return m04Active;
    if (month == 5) return m05Active;
    if (month == 6) return m06Active;
    if (month == 7) return m07Active;
    if (month == 8) return m08Active;
    if (month == 9) return m09Active;
    if (month == 10) return m10Active;
    if (month == 11) return m11Active;
    if (month == 12) return m12Active;
    return false;
  }

  int get total =>
      m01 + m02 + m03 + m04 + m05 + m06 + m07 + m08 + m09 + m10 + m11 + m12;

  String get totalString => toMCOP(total, 1);

  String get totalProy => enMillon(proyeccion.total);
  String get totalReal => enMillon(real.total);

  String get totalBDGString => toMCOP(bdg.total.toInt(), 1);

  Color? get colorTotalBDG {
    if (bdg.total == 0) {
      return Colors.blue[100];
    }
    return Colors.blue[800];
  }

  Color? colorCelda(num valor, bool active) {
    if (valor == 0) {
      if (active) {
        return Colors.grey;
      } else {
        return Colors.blue[100];
      }
    }
    if (active) {
      return null;
    } else {
      if (valor < 0) {
        return Colors.purple[900];
      }
      return Colors.blue[800];
    }
  }

  Color? colorCeldaBDG(num valor) {
    if (valor == 0) {
      return Colors.blue[100];
    }
    return Colors.blue[800];
  }

  Color? colorCeldaReal(num valor) {
    if (valor == 0) {
      return Colors.green[100];
    }
    return Colors.green[900];
  }

  Map<int, ToCelda> get liveCeldas => {
        1: ToCelda(
          valor: enMillon1(m01),
          flex: 2,
          color: colorCelda(m01, m01Active),
        ),
        2: ToCelda(
          valor: enMillon1(m02),
          flex: 2,
          color: colorCelda(m02, m02Active),
        ),
        3: ToCelda(
          valor: enMillon1(m03),
          flex: 2,
          color: colorCelda(m03, m03Active),
        ),
        4: ToCelda(
          valor: enMillon1(m04),
          flex: 2,
          color: colorCelda(m04, m04Active),
        ),
        5: ToCelda(
          valor: enMillon1(m05),
          flex: 2,
          color: colorCelda(m05, m05Active),
        ),
        6: ToCelda(
          valor: enMillon1(m06),
          flex: 2,
          color: colorCelda(m06, m06Active),
        ),
        7: ToCelda(
          valor: enMillon1(m07),
          flex: 2,
          color: colorCelda(m07, m07Active),
        ),
        8: ToCelda(
          valor: enMillon1(m08),
          flex: 2,
          color: colorCelda(m08, m08Active),
        ),
        9: ToCelda(
          valor: enMillon1(m09),
          flex: 2,
          color: colorCelda(m09, m09Active),
        ),
        10: ToCelda(
          valor: enMillon1(m10),
          flex: 2,
          color: colorCelda(m10, m10Active),
        ),
        11: ToCelda(
          valor: enMillon1(m11),
          flex: 2,
          color: colorCelda(m11, m11Active),
        ),
        12: ToCelda(
          valor: enMillon1(m12),
          flex: 2,
          color: colorCelda(m12, m12Active),
        ),
      };

  Map<int, ToCelda> get bdgCeldas => {
        1: ToCelda(
          valor: enMillon1(bdg.m01),
          flex: 2,
          color: colorCeldaBDG(bdg.m01.toInt()),
        ),
        2: ToCelda(
          valor: enMillon1(bdg.m02),
          flex: 2,
          color: colorCeldaBDG(bdg.m02.toInt()),
        ),
        3: ToCelda(
          valor: enMillon1(bdg.m03),
          flex: 2,
          color: colorCeldaBDG(bdg.m03.toInt()),
        ),
        4: ToCelda(
          valor: enMillon1(bdg.m04),
          flex: 2,
          color: colorCeldaBDG(bdg.m04.toInt()),
        ),
        5: ToCelda(
          valor: enMillon1(bdg.m05),
          flex: 2,
          color: colorCeldaBDG(bdg.m05.toInt()),
        ),
        6: ToCelda(
          valor: enMillon1(bdg.m06),
          flex: 2,
          color: colorCeldaBDG(bdg.m06.toInt()),
        ),
        7: ToCelda(
          valor: enMillon1(bdg.m07),
          flex: 2,
          color: colorCeldaBDG(bdg.m07.toInt()),
        ),
        8: ToCelda(
          valor: enMillon1(bdg.m08),
          flex: 2,
          color: colorCeldaBDG(bdg.m08.toInt()),
        ),
        9: ToCelda(
          valor: enMillon1(bdg.m09),
          flex: 2,
          color: colorCeldaBDG(bdg.m09.toInt()),
        ),
        10: ToCelda(
          valor: enMillon1(bdg.m10),
          flex: 2,
          color: colorCeldaBDG(bdg.m10.toInt()),
        ),
        11: ToCelda(
          valor: enMillon1(bdg.m11),
          flex: 2,
          color: colorCeldaBDG(bdg.m11.toInt()),
        ),
        12: ToCelda(
          valor: enMillon1(bdg.m12),
          flex: 2,
          color: colorCeldaBDG(bdg.m12.toInt()),
        ),
      };

  Map<int, ToCelda> get proyCeldas => {
        1: ToCelda(
          valor: enMillon1(proyeccion.m01),
          flex: 2,
          color: colorCelda(proyeccion.m01.toInt(), m01Active),
        ),
        2: ToCelda(
          valor: enMillon1(proyeccion.m02),
          flex: 2,
          color: colorCelda(proyeccion.m02.toInt(), m02Active),
        ),
        3: ToCelda(
          valor: enMillon1(proyeccion.m03),
          flex: 2,
          color: colorCelda(proyeccion.m03.toInt(), m03Active),
        ),
        4: ToCelda(
          valor: enMillon1(proyeccion.m04),
          flex: 2,
          color: colorCelda(proyeccion.m04.toInt(), m04Active),
        ),
        5: ToCelda(
          valor: enMillon1(proyeccion.m05),
          flex: 2,
          color: colorCelda(proyeccion.m05.toInt(), m05Active),
        ),
        6: ToCelda(
          valor: enMillon1(proyeccion.m06),
          flex: 2,
          color: colorCelda(proyeccion.m06.toInt(), m06Active),
        ),
        7: ToCelda(
          valor: enMillon1(proyeccion.m07),
          flex: 2,
          color: colorCelda(proyeccion.m07.toInt(), m07Active),
        ),
        8: ToCelda(
          valor: enMillon1(proyeccion.m08),
          flex: 2,
          color: colorCelda(proyeccion.m08.toInt(), m08Active),
        ),
        9: ToCelda(
          valor: enMillon1(proyeccion.m09),
          flex: 2,
          color: colorCelda(proyeccion.m09.toInt(), m09Active),
        ),
        10: ToCelda(
          valor: enMillon1(proyeccion.m10),
          flex: 2,
          color: colorCelda(proyeccion.m10.toInt(), m10Active),
        ),
        11: ToCelda(
          valor: enMillon1(proyeccion.m11),
          flex: 2,
          color: colorCelda(proyeccion.m11.toInt(), m11Active),
        ),
        12: ToCelda(
          valor: enMillon1(proyeccion.m12),
          flex: 2,
          color: colorCelda(proyeccion.m12.toInt(), m12Active),
        ),
      };

  Map<int, ToCelda> get realCeldas => {
        1: ToCelda(
          valor: enMillon1(real.m01),
          flex: 2,
          color: colorCeldaReal(real.m01.toInt()),
        ),
        2: ToCelda(
          valor: enMillon1(real.m02),
          flex: 2,
          color: colorCeldaReal(real.m02.toInt()),
        ),
        3: ToCelda(
          valor: enMillon1(real.m03),
          flex: 2,
          color: colorCeldaReal(real.m03.toInt()),
        ),
        4: ToCelda(
          valor: enMillon1(real.m04),
          flex: 2,
          color: colorCeldaReal(real.m04.toInt()),
        ),
        5: ToCelda(
          valor: enMillon1(real.m05),
          flex: 2,
          color: colorCeldaReal(real.m05.toInt()),
        ),
        6: ToCelda(
          valor: enMillon1(real.m06),
          flex: 2,
          color: colorCeldaReal(real.m06.toInt()),
        ),
        7: ToCelda(
          valor: enMillon1(real.m07),
          flex: 2,
          color: colorCeldaReal(real.m07.toInt()),
        ),
        8: ToCelda(
          valor: enMillon1(real.m08),
          flex: 2,
          color: colorCeldaReal(real.m08.toInt()),
        ),
        9: ToCelda(
          valor: enMillon1(real.m09),
          flex: 2,
          color: colorCeldaReal(real.m09.toInt()),
        ),
        10: ToCelda(
          valor: enMillon1(real.m10),
          flex: 2,
          color: colorCeldaReal(real.m10.toInt()),
        ),
        11: ToCelda(
          valor: enMillon1(real.m11),
          flex: 2,
          color: colorCeldaReal(real.m11.toInt()),
        ),
        12: ToCelda(
          valor: enMillon1(real.m12),
          flex: 2,
          color: colorCeldaReal(real.m12.toInt()),
        ),
      };

  Color? get colorTexto {
    if (total == 0 && bdg.total == 0) {
      return Colors.grey;
    }
    return null;
  }

  Color? get colorTextoReal {
    if (total == 0 && bdg.total == 0) {
      return Colors.grey;
    }
    return colorREAL;
  }

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

  String? get comentarios {
    if (proyeccionEsp.isEmpty) return null;
    if (naturaleza == "Materiales") {
      String compra = proyeccionEsp
          .firstWhere((e) => e.especialidad == "COMPRA")
          .comentario;
      String consumo = proyeccionEsp
          .firstWhere((e) => e.especialidad == "CONSUMO(FEM)")
          .comentario;
      String delegadas = proyeccionEsp
          .firstWhere((e) => e.especialidad == "DELEGADAS")
          .comentario;
      if (compra.isEmpty && consumo.isEmpty && delegadas.isEmpty) {
        return null;
      }
      return 'COMPRA: $compra,\nCONSUMO(FEM): $consumo,\nDELEGADAS: $delegadas.';
    }
    if (naturaleza == "Servicios") {
      String ingenieria = proyeccionEsp
          .firstWhere((e) => e.especialidad == "INGENIERIA")
          .comentario;
      String permiting = proyeccionEsp
          .firstWhere((e) => e.especialidad == "PERM_SERV")
          .comentario;
      String operaion = proyeccionEsp
          .firstWhere((e) => e.especialidad == "OPERACION")
          .comentario;
      String subestaciones = proyeccionEsp
          .firstWhere((e) => e.especialidad == "SUBESTACIONES AT-MT")
          .comentario;
      String lineas = proyeccionEsp
          .firstWhere((e) => e.especialidad == "LINEAS AT")
          .comentario;
      String redes = proyeccionEsp
          .firstWhere((e) => e.especialidad == "REDES MT")
          .comentario;
      String telecontrol = proyeccionEsp
          .firstWhere((e) => e.especialidad == "TELECONTROL")
          .comentario;
      String cargapesada = proyeccionEsp
          .firstWhere((e) => e.especialidad == "CARGA PESADA")
          .comentario;
      String zanja = proyeccionEsp
          .firstWhere((e) => e.especialidad == "TEC. SIN ZANJA")
          .comentario;
      String epc = proyeccionEsp
          .firstWhere((e) => e.especialidad == "EPC - EXCLUSIVOS")
          .comentario;
      String sos = proyeccionEsp
          .firstWhere((e) => e.especialidad == "SOST. Y VALOR COMP.")
          .comentario;
      String upme = proyeccionEsp
          .firstWhere((e) => e.especialidad == "INTERVENTORIA UPME")
          .comentario;
      String ises = proyeccionEsp
          .firstWhere((e) => e.especialidad == "COMISIONAMIENTO ISES")
          .comentario;
      String otros =
          proyeccionEsp.firstWhere((e) => e.especialidad == "OTROS").comentario;
      if (ingenieria.isEmpty &&
          permiting.isEmpty &&
          operaion.isEmpty &&
          subestaciones.isEmpty &&
          lineas.isEmpty &&
          redes.isEmpty &&
          telecontrol.isEmpty &&
          cargapesada.isEmpty &&
          zanja.isEmpty &&
          epc.isEmpty &&
          sos.isEmpty &&
          upme.isEmpty &&
          ises.isEmpty &&
          otros.isEmpty) {
        return null;
      }
      return 'INGENIERIA: $ingenieria,\nPERMITING: $permiting,\nOPERACION: $operaion,\nSUBESTACIONES AT-MT: $subestaciones,\nLINEAS AT: $lineas,\nREDES MT: $redes,\nTELECONTROL: $telecontrol,\nCARGA PESADA: $cargapesada,\nTEC. SIN ZANJA: $zanja,\nEPC - EXCLUSIVOS: $epc,\nSOST. Y VALOR COMP.: $sos,\nINTERVENTORIA UPME: $upme,\nCOMISIONAMIENTO ISES: $ises,\nOTROS: $otros.';
    }
    if (naturaleza == "Otros Costos") {
      String logistica = proyeccionEsp
          .firstWhere((e) => e.especialidad == "LOGISTICA")
          .comentario;
      String seguridad = proyeccionEsp
          .firstWhere((e) => e.especialidad == "SEGURIDAD")
          .comentario;
      String agp =
          proyeccionEsp.firstWhere((e) => e.especialidad == "AGP").comentario;
      String com = proyeccionEsp
          .firstWhere((e) => e.especialidad == "PERM_COM")
          .comentario;
      String soc = proyeccionEsp
          .firstWhere((e) => e.especialidad == "PERM_SOC")
          .comentario;
      String trans = proyeccionEsp
          .firstWhere((e) => e.especialidad == "PERM_TRANS")
          .comentario;
      String comunicaciones = proyeccionEsp
          .firstWhere((e) => e.especialidad == "COMUNICACIONES")
          .comentario;
      String comunidades = proyeccionEsp
          .firstWhere((e) => e.especialidad == "GESTION COMUNIDADES")
          .comentario;
      String informacion = proyeccionEsp
          .firstWhere((e) => e.especialidad == "GESTION INFORMACION")
          .comentario;
      String interventorias = proyeccionEsp
          .firstWhere((e) => e.especialidad == "INTERVENTORIAS")
          .comentario;
      String mision = proyeccionEsp
          .firstWhere((e) => e.especialidad == "MISION CAPEX")
          .comentario;
      String retie = proyeccionEsp
          .firstWhere((e) => e.especialidad == "RETIE Y OTROS")
          .comentario;
      String vehiculos = proyeccionEsp
          .firstWhere((e) => e.especialidad == "VEHICULOS")
          .comentario;
      String ingenieria = proyeccionEsp
          .firstWhere((e) => e.especialidad == "INGENIERIA MT")
          .comentario;
      if (logistica.isEmpty &&
          seguridad.isEmpty &&
          agp.isEmpty &&
          com.isEmpty &&
          soc.isEmpty &&
          trans.isEmpty &&
          comunicaciones.isEmpty &&
          comunidades.isEmpty &&
          informacion.isEmpty &&
          interventorias.isEmpty &&
          mision.isEmpty &&
          retie.isEmpty &&
          vehiculos.isEmpty &&
          ingenieria.isEmpty) {
        return null;
      }
      return 'LOGISTICA: $logistica,\nSEGURIDAD: $seguridad,\nAGP: $agp,\nPERM_COM: $com,\nPERM_SOC: $soc,\nPERM_TRANS: $trans,\nCOMUNICACIONES: $comunicaciones,\nGESTION COMUNIDADES: $comunidades,\nGESTION INFORMACION: $informacion,\nINTERVENTORIAS: $interventorias,\nMISION CAPEX: $mision,\nRETIE Y OTROS: $retie,\nVEHICULOS: $vehiculos,\nINGENIERIA MT: $ingenieria.';
    }
    return null;
  }
}

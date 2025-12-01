import 'dart:convert';

import 'package:costii/resources/a_entero_2.dart';
import 'package:costii/resources/toCurrency.dart';

import '../../resources/titulo.dart';

class RealReg {
  String tipo;
  String mes;
  String clasedeobjeto;
  String objeto;
  String denominacionobjeto;
  num valormonedaobjeto;
  String textocabeceradocumento;
  String denominacion;
  String textopedido;
  String definicionproyecto;
  String elemento;
  String clasecoste;
  String descripclasecoste;
  String usuario;
  String nomusuario;
  String clasedocumento;
  String proyecto;
  String nomproyecto;
  String uot;
  String macrocatfinal;
  String die4e;
  String pee4e;
  String capexpurposee4e;
  String validacione4e;
  String naturaleza;
  String area;
  String documentocompras;
  String contratomarco;
  String codigoacreedor;
  String proveedor;
  String circuito;
  String ubictecnica;
  String zonaut;
  String sspd;
  String macrocatproyecto;
  String capexpurposeproyecto;
  String pcluster;
  String diproyecto;
  String peproyecto;
  String localidad;
  String ntnominal;
  String nt;
  String tpsyst;
  String parte;
  String seccion;
  String categoria;
  String otroscostos;
  String unidad;
  String unidadproyecto;
  String uotproyecto;
  String zonaejecucion;
  String anoproyecto;
  String rem1;
  String rem2;
  String concepto;
  num bdg;
  String bdgacum;
  String real;
  String fct;
  String hoja1proceso;
  String ccjustificaciones;
  String year = '';
  RealReg({
    required this.tipo,
    required this.mes,
    required this.clasedeobjeto,
    required this.objeto,
    required this.denominacionobjeto,
    required this.valormonedaobjeto,
    required this.textocabeceradocumento,
    required this.denominacion,
    required this.textopedido,
    required this.definicionproyecto,
    required this.elemento,
    required this.clasecoste,
    required this.descripclasecoste,
    required this.usuario,
    required this.nomusuario,
    required this.clasedocumento,
    required this.proyecto,
    required this.nomproyecto,
    required this.uot,
    required this.macrocatfinal,
    required this.die4e,
    required this.pee4e,
    required this.capexpurposee4e,
    required this.validacione4e,
    required this.naturaleza,
    required this.area,
    required this.documentocompras,
    required this.contratomarco,
    required this.codigoacreedor,
    required this.proveedor,
    required this.circuito,
    required this.ubictecnica,
    required this.zonaut,
    required this.sspd,
    required this.macrocatproyecto,
    required this.capexpurposeproyecto,
    required this.pcluster,
    required this.diproyecto,
    required this.peproyecto,
    required this.localidad,
    required this.ntnominal,
    required this.nt,
    required this.tpsyst,
    required this.parte,
    required this.seccion,
    required this.categoria,
    required this.otroscostos,
    required this.unidad,
    required this.unidadproyecto,
    required this.uotproyecto,
    required this.zonaejecucion,
    required this.anoproyecto,
    required this.rem1,
    required this.rem2,
    required this.concepto,
    required this.bdg,
    required this.bdgacum,
    required this.real,
    required this.fct,
    required this.hoja1proceso,
    required this.ccjustificaciones,
  });

  List<String> toList() {
    return [
      tipo,
      mes,
      clasedeobjeto,
      objeto,
      denominacionobjeto,
      valormonedaobjeto.toString(),
      textocabeceradocumento,
      denominacion,
      textopedido,
      definicionproyecto,
      elemento,
      clasecoste,
      descripclasecoste,
      usuario,
      nomusuario,
      clasedocumento,
      proyecto,
      nomproyecto,
      uot,
      macrocatfinal,
      die4e,
      pee4e,
      capexpurposee4e,
      validacione4e,
      naturaleza,
      area,
      documentocompras,
      contratomarco,
      codigoacreedor,
      proveedor,
      circuito,
      ubictecnica,
      zonaut,
      sspd,
      macrocatproyecto,
      capexpurposeproyecto,
      pcluster,
      diproyecto,
      peproyecto,
      localidad,
      ntnominal,
      nt,
      tpsyst,
      parte,
      seccion,
      categoria,
      otroscostos,
      unidad,
      unidadproyecto,
      uotproyecto,
      zonaejecucion,
      anoproyecto,
      rem1,
      rem2,
      concepto,
      bdg.toString(),
      bdgacum,
      real,
      fct,
      hoja1proceso,
      ccjustificaciones,
    ];
  }

  RealReg copyWith({
    String? tipo,
    String? mes,
    String? clasedeobjeto,
    String? objeto,
    String? denominacionobjeto,
    num? valormonedaobjeto,
    String? textocabeceradocumento,
    String? denominacion,
    String? textopedido,
    String? definicionproyecto,
    String? elemento,
    String? clasecoste,
    String? descripclasecoste,
    String? usuario,
    String? nomusuario,
    String? clasedocumento,
    String? proyecto,
    String? nomproyecto,
    String? uot,
    String? macrocatfinal,
    String? die4e,
    String? pee4e,
    String? capexpurposee4e,
    String? validacione4e,
    String? naturaleza,
    String? area,
    String? documentocompras,
    String? contratomarco,
    String? codigoacreedor,
    String? proveedor,
    String? circuito,
    String? ubictecnica,
    String? zonaut,
    String? sspd,
    String? macrocatproyecto,
    String? capexpurposeproyecto,
    String? pcluster,
    String? diproyecto,
    String? peproyecto,
    String? localidad,
    String? ntnominal,
    String? nt,
    String? tpsyst,
    String? parte,
    String? seccion,
    String? categoria,
    String? otroscostos,
    String? unidad,
    String? unidadproyecto,
    String? uotproyecto,
    String? zonaejecucion,
    String? anoproyecto,
    String? rem1,
    String? rem2,
    String? concepto,
    num? bdg,
    String? bdgacum,
    String? real,
    String? fct,
    String? hoja1proceso,
    String? ccjustificaciones,
  }) {
    return RealReg(
      tipo: tipo ?? this.tipo,
      mes: mes ?? this.mes,
      clasedeobjeto: clasedeobjeto ?? this.clasedeobjeto,
      objeto: objeto ?? this.objeto,
      denominacionobjeto: denominacionobjeto ?? this.denominacionobjeto,
      valormonedaobjeto: valormonedaobjeto ?? this.valormonedaobjeto,
      textocabeceradocumento:
          textocabeceradocumento ?? this.textocabeceradocumento,
      denominacion: denominacion ?? this.denominacion,
      textopedido: textopedido ?? this.textopedido,
      definicionproyecto: definicionproyecto ?? this.definicionproyecto,
      elemento: elemento ?? this.elemento,
      clasecoste: clasecoste ?? this.clasecoste,
      descripclasecoste: descripclasecoste ?? this.descripclasecoste,
      usuario: usuario ?? this.usuario,
      nomusuario: nomusuario ?? this.nomusuario,
      clasedocumento: clasedocumento ?? this.clasedocumento,
      proyecto: proyecto ?? this.proyecto,
      nomproyecto: nomproyecto ?? this.nomproyecto,
      uot: uot ?? this.uot,
      macrocatfinal: macrocatfinal ?? this.macrocatfinal,
      die4e: die4e ?? this.die4e,
      pee4e: pee4e ?? this.pee4e,
      capexpurposee4e: capexpurposee4e ?? this.capexpurposee4e,
      validacione4e: validacione4e ?? this.validacione4e,
      naturaleza: naturaleza ?? this.naturaleza,
      area: area ?? this.area,
      documentocompras: documentocompras ?? this.documentocompras,
      contratomarco: contratomarco ?? this.contratomarco,
      codigoacreedor: codigoacreedor ?? this.codigoacreedor,
      proveedor: proveedor ?? this.proveedor,
      circuito: circuito ?? this.circuito,
      ubictecnica: ubictecnica ?? this.ubictecnica,
      zonaut: zonaut ?? this.zonaut,
      sspd: sspd ?? this.sspd,
      macrocatproyecto: macrocatproyecto ?? this.macrocatproyecto,
      capexpurposeproyecto: capexpurposeproyecto ?? this.capexpurposeproyecto,
      pcluster: pcluster ?? this.pcluster,
      diproyecto: diproyecto ?? this.diproyecto,
      peproyecto: peproyecto ?? this.peproyecto,
      localidad: localidad ?? this.localidad,
      ntnominal: ntnominal ?? this.ntnominal,
      nt: nt ?? this.nt,
      tpsyst: tpsyst ?? this.tpsyst,
      parte: parte ?? this.parte,
      seccion: seccion ?? this.seccion,
      categoria: categoria ?? this.categoria,
      otroscostos: otroscostos ?? this.otroscostos,
      unidad: unidad ?? this.unidad,
      unidadproyecto: unidadproyecto ?? this.unidadproyecto,
      uotproyecto: uotproyecto ?? this.uotproyecto,
      zonaejecucion: zonaejecucion ?? this.zonaejecucion,
      anoproyecto: anoproyecto ?? this.anoproyecto,
      rem1: rem1 ?? this.rem1,
      rem2: rem2 ?? this.rem2,
      concepto: concepto ?? this.concepto,
      bdg: bdg ?? this.bdg,
      bdgacum: bdgacum ?? this.bdgacum,
      real: real ?? this.real,
      fct: fct ?? this.fct,
      hoja1proceso: hoja1proceso ?? this.hoja1proceso,
      ccjustificaciones: ccjustificaciones ?? this.ccjustificaciones,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tipo': tipo,
      'mes': mes,
      'clasedeobjeto': clasedeobjeto,
      'objeto': objeto,
      'denominacionobjeto': denominacionobjeto,
      'valormonedaobjeto': valormonedaobjeto,
      'textocabeceradocumento': textocabeceradocumento,
      'denominacion': denominacion,
      'textopedido': textopedido,
      'definicionproyecto': definicionproyecto,
      'elemento': elemento,
      'clasecoste': clasecoste,
      'descripclasecoste': descripclasecoste,
      'usuario': usuario,
      'nomusuario': nomusuario,
      'clasedocumento': clasedocumento,
      'proyecto': proyecto,
      'nomproyecto': nomproyecto,
      'uot': uot,
      'macrocatfinal': macrocatfinal,
      'die4e': die4e,
      'pee4e': pee4e,
      'capexpurposee4e': capexpurposee4e,
      'validacione4e': validacione4e,
      'naturaleza': naturaleza,
      'area': area,
      'documentocompras': documentocompras,
      'contratomarco': contratomarco,
      'codigoacreedor': codigoacreedor,
      'proveedor': proveedor,
      'circuito': circuito,
      'ubictecnica': ubictecnica,
      'zonaut': zonaut,
      'sspd': sspd,
      'macrocatproyecto': macrocatproyecto,
      'capexpurposeproyecto': capexpurposeproyecto,
      'pcluster': pcluster,
      'diproyecto': diproyecto,
      'peproyecto': peproyecto,
      'localidad': localidad,
      'ntnominal': ntnominal,
      'nt': nt,
      'tpsyst': tpsyst,
      'parte': parte,
      'seccion': seccion,
      'categoria': categoria,
      'otroscostos': otroscostos,
      'unidad': unidad,
      'unidadproyecto': unidadproyecto,
      'uotproyecto': uotproyecto,
      'zonaejecucion': zonaejecucion,
      'anoproyecto': anoproyecto,
      'rem1': rem1,
      'rem2': rem2,
      'concepto': concepto,
      'bdg': bdg,
      'bdgacum': bdgacum,
      'real': real,
      'fct': fct,
      'hoja1proceso': hoja1proceso,
      'ccjustificaciones': ccjustificaciones,
    };
  }

  factory RealReg.fromMap(Map<String, dynamic> map) {
    return RealReg(
      tipo: map['tipo'].toString(),
      mes: map['mes'].toString(),
      clasedeobjeto: map['clasedeobjeto'].toString(),
      objeto: map['objeto'].toString(),
      denominacionobjeto: map['denominacionobjeto'].toString(),
      valormonedaobjeto: aNum(map['valormonedaobjeto'].toString()),
      textocabeceradocumento: map['textocabeceradocumento'].toString(),
      denominacion: map['denominacion'].toString(),
      textopedido: map['textopedido'].toString(),
      definicionproyecto: map['definicionproyecto'].toString(),
      elemento: map['elemento'].toString(),
      clasecoste: map['clasecoste'].toString(),
      descripclasecoste: map['descripclasecoste'].toString(),
      usuario: map['usuario'].toString(),
      nomusuario: map['nomusuario'].toString(),
      clasedocumento: map['clasedocumento'].toString(),
      proyecto: map['proyecto'].toString(),
      nomproyecto: map['nomproyecto'].toString(),
      uot: map['uot'].toString(),
      macrocatfinal: map['macrocatfinal'].toString(),
      die4e: map['die4e'].toString(),
      pee4e: map['pee4e'].toString(),
      capexpurposee4e: map['capexpurposee4e'].toString(),
      validacione4e: map['validacione4e'].toString(),
      naturaleza: map['naturaleza'].toString(),
      area: map['area'].toString(),
      documentocompras: map['documentocompras'].toString(),
      contratomarco: map['contratomarco'].toString(),
      codigoacreedor: map['codigoacreedor'].toString(),
      proveedor: map['proveedor'].toString(),
      circuito: map['circuito'].toString(),
      ubictecnica: map['ubictecnica'].toString(),
      zonaut: map['zonaut'].toString(),
      sspd: map['sspd'].toString(),
      macrocatproyecto: map['macrocatproyecto'].toString(),
      capexpurposeproyecto: map['capexpurposeproyecto'].toString(),
      pcluster: map['pcluster'].toString(),
      diproyecto: map['diproyecto'].toString(),
      peproyecto: map['peproyecto'].toString(),
      localidad: map['localidad'].toString(),
      ntnominal: map['ntnominal'].toString(),
      nt: map['nt'].toString(),
      tpsyst: map['tpsyst'].toString(),
      parte: map['parte'].toString(),
      seccion: map['seccion'].toString(),
      categoria: map['categoria'].toString(),
      otroscostos: map['otroscostos'].toString(),
      unidad: map['unidad'].toString(),
      unidadproyecto: map['unidadproyecto'].toString(),
      uotproyecto: map['uotproyecto'].toString(),
      zonaejecucion: map['zonaejecucion'].toString(),
      anoproyecto: map['anoproyecto'].toString(),
      rem1: map['rem1'].toString(),
      rem2: map['rem2'].toString(),
      concepto: map['concepto'].toString(),
      bdg: aNum(map['bdg'].toString()),
      bdgacum: map['bdgacum'].toString(),
      real: map['real'].toString(),
      fct: map['fct'].toString(),
      hoja1proceso: map['hoja1proceso'].toString(),
      ccjustificaciones: map['ccjustificaciones'].toString(),
    );
  }

  factory RealReg.fromInit() {
    return RealReg(
      tipo: '',
      mes: '',
      clasedeobjeto: '',
      objeto: '',
      denominacionobjeto: '',
      valormonedaobjeto: aNum(''),
      textocabeceradocumento: '',
      denominacion: '',
      textopedido: '',
      definicionproyecto: '',
      elemento: '',
      clasecoste: '',
      descripclasecoste: '',
      usuario: '',
      nomusuario: '',
      clasedocumento: '',
      proyecto: '',
      nomproyecto: '',
      uot: '',
      macrocatfinal: '',
      die4e: '',
      pee4e: '',
      capexpurposee4e: '',
      validacione4e: '',
      naturaleza: '',
      area: '',
      documentocompras: '',
      contratomarco: '',
      codigoacreedor: '',
      proveedor: '',
      circuito: '',
      ubictecnica: '',
      zonaut: '',
      sspd: '',
      macrocatproyecto: '',
      capexpurposeproyecto: '',
      pcluster: '',
      diproyecto: '',
      peproyecto: '',
      localidad: '',
      ntnominal: '',
      nt: '',
      tpsyst: '',
      parte: '',
      seccion: '',
      categoria: '',
      otroscostos: '',
      unidad: '',
      unidadproyecto: '',
      uotproyecto: '',
      zonaejecucion: '',
      anoproyecto: '',
      rem1: '',
      rem2: '',
      concepto: '',
      bdg: aNum(''),
      bdgacum: '',
      real: '',
      fct: '',
      hoja1proceso: '',
      ccjustificaciones: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RealReg.fromJson(String source) => RealReg.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BdgReg(tipo: $tipo, mes: $mes, clasedeobjeto: $clasedeobjeto, objeto: $objeto, denominacionobjeto: $denominacionobjeto, valormonedaobjeto: $valormonedaobjeto, textocabeceradocumento: $textocabeceradocumento, denominacion: $denominacion, textopedido: $textopedido, definicionproyecto: $definicionproyecto, elemento: $elemento, clasecoste: $clasecoste, descripclasecoste: $descripclasecoste, usuario: $usuario, nomusuario: $nomusuario, clasedocumento: $clasedocumento, proyecto: $proyecto, nomproyecto: $nomproyecto, uot: $uot, macrocatfinal: $macrocatfinal, die4e: $die4e, pee4e: $pee4e, capexpurposee4e: $capexpurposee4e, validacione4e: $validacione4e, naturaleza: $naturaleza, area: $area, documentocompras: $documentocompras, contratomarco: $contratomarco, codigoacreedor: $codigoacreedor, proveedor: $proveedor, circuito: $circuito, ubictecnica: $ubictecnica, zonaut: $zonaut, sspd: $sspd, macrocatproyecto: $macrocatproyecto, capexpurposeproyecto: $capexpurposeproyecto, pcluster: $pcluster, diproyecto: $diproyecto, peproyecto: $peproyecto, localidad: $localidad, ntnominal: $ntnominal, nt: $nt, tpsyst: $tpsyst, parte: $parte, seccion: $seccion, categoria: $categoria, otroscostos: $otroscostos, unidad: $unidad, unidadproyecto: $unidadproyecto, uotproyecto: $uotproyecto, zonaejecucion: $zonaejecucion, anoproyecto: $anoproyecto, rem1: $rem1, rem2: $rem2, concepto: $concepto, bdg: $bdg, bdgacum: $bdgacum, real: $real, fct: $fct, hoja1proceso: $hoja1proceso, ccjustificaciones: $ccjustificaciones)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RealReg &&
        other.tipo == tipo &&
        other.mes == mes &&
        other.clasedeobjeto == clasedeobjeto &&
        other.objeto == objeto &&
        other.denominacionobjeto == denominacionobjeto &&
        other.valormonedaobjeto == valormonedaobjeto &&
        other.textocabeceradocumento == textocabeceradocumento &&
        other.denominacion == denominacion &&
        other.textopedido == textopedido &&
        other.definicionproyecto == definicionproyecto &&
        other.elemento == elemento &&
        other.clasecoste == clasecoste &&
        other.descripclasecoste == descripclasecoste &&
        other.usuario == usuario &&
        other.nomusuario == nomusuario &&
        other.clasedocumento == clasedocumento &&
        other.proyecto == proyecto &&
        other.nomproyecto == nomproyecto &&
        other.uot == uot &&
        other.macrocatfinal == macrocatfinal &&
        other.die4e == die4e &&
        other.pee4e == pee4e &&
        other.capexpurposee4e == capexpurposee4e &&
        other.validacione4e == validacione4e &&
        other.naturaleza == naturaleza &&
        other.area == area &&
        other.documentocompras == documentocompras &&
        other.contratomarco == contratomarco &&
        other.codigoacreedor == codigoacreedor &&
        other.proveedor == proveedor &&
        other.circuito == circuito &&
        other.ubictecnica == ubictecnica &&
        other.zonaut == zonaut &&
        other.sspd == sspd &&
        other.macrocatproyecto == macrocatproyecto &&
        other.capexpurposeproyecto == capexpurposeproyecto &&
        other.pcluster == pcluster &&
        other.diproyecto == diproyecto &&
        other.peproyecto == peproyecto &&
        other.localidad == localidad &&
        other.ntnominal == ntnominal &&
        other.nt == nt &&
        other.tpsyst == tpsyst &&
        other.parte == parte &&
        other.seccion == seccion &&
        other.categoria == categoria &&
        other.otroscostos == otroscostos &&
        other.unidad == unidad &&
        other.unidadproyecto == unidadproyecto &&
        other.uotproyecto == uotproyecto &&
        other.zonaejecucion == zonaejecucion &&
        other.anoproyecto == anoproyecto &&
        other.rem1 == rem1 &&
        other.rem2 == rem2 &&
        other.concepto == concepto &&
        other.bdg == bdg &&
        other.bdgacum == bdgacum &&
        other.real == real &&
        other.fct == fct &&
        other.hoja1proceso == hoja1proceso &&
        other.ccjustificaciones == ccjustificaciones;
  }

  @override
  int get hashCode {
    return tipo.hashCode ^
        mes.hashCode ^
        clasedeobjeto.hashCode ^
        objeto.hashCode ^
        denominacionobjeto.hashCode ^
        valormonedaobjeto.hashCode ^
        textocabeceradocumento.hashCode ^
        denominacion.hashCode ^
        textopedido.hashCode ^
        definicionproyecto.hashCode ^
        elemento.hashCode ^
        clasecoste.hashCode ^
        descripclasecoste.hashCode ^
        usuario.hashCode ^
        nomusuario.hashCode ^
        clasedocumento.hashCode ^
        proyecto.hashCode ^
        nomproyecto.hashCode ^
        uot.hashCode ^
        macrocatfinal.hashCode ^
        die4e.hashCode ^
        pee4e.hashCode ^
        capexpurposee4e.hashCode ^
        validacione4e.hashCode ^
        naturaleza.hashCode ^
        area.hashCode ^
        documentocompras.hashCode ^
        contratomarco.hashCode ^
        codigoacreedor.hashCode ^
        proveedor.hashCode ^
        circuito.hashCode ^
        ubictecnica.hashCode ^
        zonaut.hashCode ^
        sspd.hashCode ^
        macrocatproyecto.hashCode ^
        capexpurposeproyecto.hashCode ^
        pcluster.hashCode ^
        diproyecto.hashCode ^
        peproyecto.hashCode ^
        localidad.hashCode ^
        ntnominal.hashCode ^
        nt.hashCode ^
        tpsyst.hashCode ^
        parte.hashCode ^
        seccion.hashCode ^
        categoria.hashCode ^
        otroscostos.hashCode ^
        unidad.hashCode ^
        unidadproyecto.hashCode ^
        uotproyecto.hashCode ^
        zonaejecucion.hashCode ^
        anoproyecto.hashCode ^
        rem1.hashCode ^
        rem2.hashCode ^
        concepto.hashCode ^
        bdg.hashCode ^
        bdgacum.hashCode ^
        real.hashCode ^
        fct.hashCode ^
        hoja1proceso.hashCode ^
        ccjustificaciones.hashCode;
  }

  List<ToCelda> get celdas => [
        ToCelda(valor: nomproyecto, flex: 2),
        ToCelda(valor: naturaleza, flex: 2),
        ToCelda(valor: mes, flex: 1),
        ToCelda(valor: enMillon1(valormonedaobjeto), flex: 1),
        ToCelda(valor: denominacion, flex: 2),
        ToCelda(valor: documentocompras, flex: 2),
        ToCelda(valor: proveedor, flex: 2),
        ToCelda(valor: nomusuario, flex: 2),
      ];
}

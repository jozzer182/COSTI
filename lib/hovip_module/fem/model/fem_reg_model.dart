import 'dart:convert';

class FemReg {
  String item;
  String year;
  String id;
  String estado;
  String estdespacho;
  String tipo;
  String fechainicial;
  String fechacambio;
  String fechasolicitud;
  String unidad;
  String codigo;
  String proyecto;
  String circuito;
  String pm;
  String solicitante;
  String pdi;
  String wbe;
  String proyectowbe;
  String comentario1;
  String comentario2;
  String e4e;
  String descripcion;
  String um;
  String m01q1;
  String m01q2;
  String m01qx;
  String m02q1;
  String m02q2;
  String m02qx;
  String m03q1;
  String m03q2;
  String m03qx;
  String m04q1;
  String m04q2;
  String m04qx;
  String m05q1;
  String m05q2;
  String m05qx;
  String m06q1;
  String m06q2;
  String m06qx;
  String m07q1;
  String m07q2;
  String m07qx;
  String m08q1;
  String m08q2;
  String m08qx;
  String m09q1;
  String m09q2;
  String m09qx;
  String m10q1;
  String m10q2;
  String m10qx;
  String m11q1;
  String m11q2;
  String m11qx;
  String m12q1;
  String m12q2;
  String m12qx;
  FemReg({
    required this.item,
    required this.year,
    required this.id,
    required this.estado,
    required this.estdespacho,
    required this.tipo,
    required this.fechainicial,
    required this.fechacambio,
    required this.fechasolicitud,
    required this.unidad,
    required this.codigo,
    required this.proyecto,
    required this.circuito,
    required this.pm,
    required this.solicitante,
    required this.pdi,
    required this.wbe,
    required this.proyectowbe,
    required this.comentario1,
    required this.comentario2,
    required this.e4e,
    required this.descripcion,
    required this.um,
    required this.m01q1,
    required this.m01q2,
    required this.m01qx,
    required this.m02q1,
    required this.m02q2,
    required this.m02qx,
    required this.m03q1,
    required this.m03q2,
    required this.m03qx,
    required this.m04q1,
    required this.m04q2,
    required this.m04qx,
    required this.m05q1,
    required this.m05q2,
    required this.m05qx,
    required this.m06q1,
    required this.m06q2,
    required this.m06qx,
    required this.m07q1,
    required this.m07q2,
    required this.m07qx,
    required this.m08q1,
    required this.m08q2,
    required this.m08qx,
    required this.m09q1,
    required this.m09q2,
    required this.m09qx,
    required this.m10q1,
    required this.m10q2,
    required this.m10qx,
    required this.m11q1,
    required this.m11q2,
    required this.m11qx,
    required this.m12q1,
    required this.m12q2,
    required this.m12qx,
  });

  FemReg copyWith({
    String? item,
    String? year,
    String? id,
    String? estado,
    String? estdespacho,
    String? tipo,
    String? fechainicial,
    String? fechacambio,
    String? fechasolicitud,
    String? unidad,
    String? codigo,
    String? proyecto,
    String? circuito,
    String? pm,
    String? solicitante,
    String? pdi,
    String? wbe,
    String? proyectowbe,
    String? comentario1,
    String? comentario2,
    String? e4e,
    String? descripcion,
    String? um,
    String? m01q1,
    String? m01q2,
    String? m01qx,
    String? m02q1,
    String? m02q2,
    String? m02qx,
    String? m03q1,
    String? m03q2,
    String? m03qx,
    String? m04q1,
    String? m04q2,
    String? m04qx,
    String? m05q1,
    String? m05q2,
    String? m05qx,
    String? m06q1,
    String? m06q2,
    String? m06qx,
    String? m07q1,
    String? m07q2,
    String? m07qx,
    String? m08q1,
    String? m08q2,
    String? m08qx,
    String? m09q1,
    String? m09q2,
    String? m09qx,
    String? m10q1,
    String? m10q2,
    String? m10qx,
    String? m11q1,
    String? m11q2,
    String? m11qx,
    String? m12q1,
    String? m12q2,
    String? m12qx,
  }) {
    return FemReg(
      item: item ?? this.item,
      year: year ?? this.year,
      id: id ?? this.id,
      estado: estado ?? this.estado,
      estdespacho: estdespacho ?? this.estdespacho,
      tipo: tipo ?? this.tipo,
      fechainicial: fechainicial ?? this.fechainicial,
      fechacambio: fechacambio ?? this.fechacambio,
      fechasolicitud: fechasolicitud ?? this.fechasolicitud,
      unidad: unidad ?? this.unidad,
      codigo: codigo ?? this.codigo,
      proyecto: proyecto ?? this.proyecto,
      circuito: circuito ?? this.circuito,
      pm: pm ?? this.pm,
      solicitante: solicitante ?? this.solicitante,
      pdi: pdi ?? this.pdi,
      wbe: wbe ?? this.wbe,
      proyectowbe: proyectowbe ?? this.proyectowbe,
      comentario1: comentario1 ?? this.comentario1,
      comentario2: comentario2 ?? this.comentario2,
      e4e: e4e ?? this.e4e,
      descripcion: descripcion ?? this.descripcion,
      um: um ?? this.um,
      m01q1: m01q1 ?? this.m01q1,
      m01q2: m01q2 ?? this.m01q2,
      m01qx: m01qx ?? this.m01qx,
      m02q1: m02q1 ?? this.m02q1,
      m02q2: m02q2 ?? this.m02q2,
      m02qx: m02qx ?? this.m02qx,
      m03q1: m03q1 ?? this.m03q1,
      m03q2: m03q2 ?? this.m03q2,
      m03qx: m03qx ?? this.m03qx,
      m04q1: m04q1 ?? this.m04q1,
      m04q2: m04q2 ?? this.m04q2,
      m04qx: m04qx ?? this.m04qx,
      m05q1: m05q1 ?? this.m05q1,
      m05q2: m05q2 ?? this.m05q2,
      m05qx: m05qx ?? this.m05qx,
      m06q1: m06q1 ?? this.m06q1,
      m06q2: m06q2 ?? this.m06q2,
      m06qx: m06qx ?? this.m06qx,
      m07q1: m07q1 ?? this.m07q1,
      m07q2: m07q2 ?? this.m07q2,
      m07qx: m07qx ?? this.m07qx,
      m08q1: m08q1 ?? this.m08q1,
      m08q2: m08q2 ?? this.m08q2,
      m08qx: m08qx ?? this.m08qx,
      m09q1: m09q1 ?? this.m09q1,
      m09q2: m09q2 ?? this.m09q2,
      m09qx: m09qx ?? this.m09qx,
      m10q1: m10q1 ?? this.m10q1,
      m10q2: m10q2 ?? this.m10q2,
      m10qx: m10qx ?? this.m10qx,
      m11q1: m11q1 ?? this.m11q1,
      m11q2: m11q2 ?? this.m11q2,
      m11qx: m11qx ?? this.m11qx,
      m12q1: m12q1 ?? this.m12q1,
      m12q2: m12q2 ?? this.m12q2,
      m12qx: m12qx ?? this.m12qx,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'item': item,
      'year': year,
      'id': id,
      'estado': estado,
      'estdespacho': estdespacho,
      'tipo': tipo,
      'fechainicial': fechainicial,
      'fechacambio': fechacambio,
      'fechasolicitud': fechasolicitud,
      'unidad': unidad,
      'codigo': codigo,
      'proyecto': proyecto,
      'circuito': circuito,
      'pm': pm,
      'solicitante': solicitante,
      'pdi': pdi,
      'wbe': wbe,
      'proyectowbe': proyectowbe,
      'comentario1': comentario1,
      'comentario2': comentario2,
      'e4e': e4e,
      'descripcion': descripcion,
      'um': um,
      'm01q1': m01q1,
      'm01q2': m01q2,
      'm01qx': m01qx,
      'm02q1': m02q1,
      'm02q2': m02q2,
      'm02qx': m02qx,
      'm03q1': m03q1,
      'm03q2': m03q2,
      'm03qx': m03qx,
      'm04q1': m04q1,
      'm04q2': m04q2,
      'm04qx': m04qx,
      'm05q1': m05q1,
      'm05q2': m05q2,
      'm05qx': m05qx,
      'm06q1': m06q1,
      'm06q2': m06q2,
      'm06qx': m06qx,
      'm07q1': m07q1,
      'm07q2': m07q2,
      'm07qx': m07qx,
      'm08q1': m08q1,
      'm08q2': m08q2,
      'm08qx': m08qx,
      'm09q1': m09q1,
      'm09q2': m09q2,
      'm09qx': m09qx,
      'm10q1': m10q1,
      'm10q2': m10q2,
      'm10qx': m10qx,
      'm11q1': m11q1,
      'm11q2': m11q2,
      'm11qx': m11qx,
      'm12q1': m12q1,
      'm12q2': m12q2,
      'm12qx': m12qx,
    };
  }

  factory FemReg.fromMap(Map<String, dynamic> map) {
    return FemReg(
      item: map['item'].toString(),
      year: map['year'].toString(),
      id: map['id'].toString(),
      estado: map['estado'].toString(),
      estdespacho: map['estdespacho'].toString(),
      tipo: map['tipo'].toString(),
      fechainicial: map['fechainicial'].toString(),
      fechacambio: map['fechacambio'].toString(),
      fechasolicitud: map['fechasolicitud'].toString(),
      unidad: map['unidad'].toString(),
      codigo: map['codigo'].toString(),
      proyecto: map['proyecto'].toString(),
      circuito: map['circuito'].toString(),
      pm: map['pm'].toString(),
      solicitante: map['solicitante'].toString(),
      pdi: map['pdi'].toString(),
      wbe: map['wbe'].toString(),
      proyectowbe: map['proyectowbe'].toString(),
      comentario1: map['comentario1'].toString(),
      comentario2: map['comentario2'].toString(),
      e4e: map['e4e'].toString(),
      descripcion: map['descripcion'].toString(),
      um: map['um'].toString(),
      m01q1: map['m01q1'].toString(),
      m01q2: map['m01q2'].toString(),
      m01qx: map['m01qx'].toString(),
      m02q1: map['m02q1'].toString(),
      m02q2: map['m02q2'].toString(),
      m02qx: map['m02qx'].toString(),
      m03q1: map['m03q1'].toString(),
      m03q2: map['m03q2'].toString(),
      m03qx: map['m03qx'].toString(),
      m04q1: map['m04q1'].toString(),
      m04q2: map['m04q2'].toString(),
      m04qx: map['m04qx'].toString(),
      m05q1: map['m05q1'].toString(),
      m05q2: map['m05q2'].toString(),
      m05qx: map['m05qx'].toString(),
      m06q1: map['m06q1'].toString(),
      m06q2: map['m06q2'].toString(),
      m06qx: map['m06qx'].toString(),
      m07q1: map['m07q1'].toString(),
      m07q2: map['m07q2'].toString(),
      m07qx: map['m07qx'].toString(),
      m08q1: map['m08q1'].toString(),
      m08q2: map['m08q2'].toString(),
      m08qx: map['m08qx'].toString(),
      m09q1: map['m09q1'].toString(),
      m09q2: map['m09q2'].toString(),
      m09qx: map['m09qx'].toString(),
      m10q1: map['m10q1'].toString(),
      m10q2: map['m10q2'].toString(),
      m10qx: map['m10qx'].toString(),
      m11q1: map['m11q1'].toString(),
      m11q2: map['m11q2'].toString(),
      m11qx: map['m11qx'].toString(),
      m12q1: map['m12q1'].toString(),
      m12q2: map['m12q2'].toString(),
      m12qx: map['m12qx'].toString(),
    );
  }

  factory FemReg.fromList(List<dynamic> ls) {
    var fichaReg = FemReg(
      item: ls[0].toString(),
      year: ls[0].toString(),
      id: ls[0].toString(),
      estado: ls[1].toString(),
      estdespacho: ls[2].toString(),
      tipo: ls[3].toString(),
      fechainicial: ls[4].toString().length > 10
          ? ls[4].toString().substring(0, 10)
          : ls[4].toString(),
      fechacambio: ls[5].toString().length > 10
          ? ls[5].toString().substring(0, 10)
          : ls[5].toString(),
      fechasolicitud: ls[6].toString().length > 10
          ? ls[6].toString().substring(0, 10)
          : ls[6].toString(),
      unidad: ls[7].toString(),
      codigo: ls[8].toString(),
      proyecto: ls[9].toString(),
      circuito: ls[10].toString(),
      pm: ls[11].toString(),
      solicitante: ls[12].toString(),
      pdi: ls[13].toString(),
      wbe: ls[14].toString(),
      proyectowbe: ls[15].toString(),
      comentario1: ls[16]
          .toString()
          .replaceAll('"', '')
          .replaceAll(';', '')
          .replaceAll(',', '')
          .replaceAll("\n", " "),
      comentario2: ls[17]
          .toString()
          .replaceAll('"', '')
          .replaceAll(';', '')
          .replaceAll(',', '')
          .replaceAll("\n", " "),
      e4e: ls[18].toString(),
      descripcion: ls[19]
          .toString()
          .replaceAll('"', '')
          .replaceAll(';', '')
          .replaceAll(',', ''),
      um: ls[20].toString(),
      m01q1: ls[21].toString(),
      m01q2: ls[22].toString(),
      m01qx: ls[23].toString(),
      m02q1: ls[24].toString(),
      m02q2: ls[25].toString(),
      m02qx: ls[26].toString(),
      m03q1: ls[27].toString(),
      m03q2: ls[28].toString(),
      m03qx: ls[29].toString(),
      m04q1: ls[30].toString(),
      m04q2: ls[31].toString(),
      m04qx: ls[32].toString(),
      m05q1: ls[33].toString(),
      m05q2: ls[34].toString(),
      m05qx: ls[35].toString(),
      m06q1: ls[36].toString(),
      m06q2: ls[37].toString(),
      m06qx: ls[38].toString(),
      m07q1: ls[39].toString(),
      m07q2: ls[40].toString(),
      m07qx: ls[41].toString(),
      m08q1: ls[42].toString(),
      m08q2: ls[43].toString(),
      m08qx: ls[44].toString(),
      m09q1: ls[45].toString(),
      m09q2: ls[46].toString(),
      m09qx: ls[47].toString(),
      m10q1: ls[48].toString(),
      m10q2: ls[49].toString(),
      m10qx: ls[50].toString(),
      m11q1: ls[51].toString(),
      m11q2: ls[52].toString(),
      m11qx: ls[53].toString(),
      m12q1: ls[54].toString(),
      m12q2: ls[55].toString(),
      m12qx: ls[56].toString(),
    );
    return fichaReg;
  }

  String toJson() => json.encode(toMap());

  factory FemReg.fromJson(String source) => FemReg.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FichaReg(item: $item, year: $year, id: $id, estado: $estado, estdespacho: $estdespacho, tipo: $tipo, fechainicial: $fechainicial, fechacambio: $fechacambio, fechasolicitud: $fechasolicitud, unidad: $unidad, codigo: $codigo, proyecto: $proyecto, circuito: $circuito, pm: $pm, solicitante: $solicitante, pdi: $pdi, wbe: $wbe, proyectowbe: $proyectowbe, comentario1: $comentario1, comentario2: $comentario2, e4e: $e4e, descripcion: $descripcion, um: $um, m01q1: $m01q1, m01q2: $m01q2, m01qx: $m01qx, m02q1: $m02q1, m02q2: $m02q2, m02qx: $m02qx, m03q1: $m03q1, m03q2: $m03q2, m03qx: $m03qx, m04q1: $m04q1, m04q2: $m04q2, m04qx: $m04qx, m05q1: $m05q1, m05q2: $m05q2, m05qx: $m05qx, m06q1: $m06q1, m06q2: $m06q2, m06qx: $m06qx, m07q1: $m07q1, m07q2: $m07q2, m07qx: $m07qx, m08q1: $m08q1, m08q2: $m08q2, m08qx: $m08qx, m09q1: $m09q1, m09q2: $m09q2, m09qx: $m09qx, m10q1: $m10q1, m10q2: $m10q2, m10qx: $m10qx, m11q1: $m11q1, m11q2: $m11q2, m11qx: $m11qx, m12q1: $m12q1, m12q2: $m12q2, m12qx: $m12qx)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FemReg &&
        other.item == item &&
        other.year == year &&
        other.id == id &&
        other.estado == estado &&
        other.estdespacho == estdespacho &&
        other.tipo == tipo &&
        other.fechainicial == fechainicial &&
        other.fechacambio == fechacambio &&
        other.fechasolicitud == fechasolicitud &&
        other.unidad == unidad &&
        other.codigo == codigo &&
        other.proyecto == proyecto &&
        other.circuito == circuito &&
        other.pm == pm &&
        other.solicitante == solicitante &&
        other.pdi == pdi &&
        other.wbe == wbe &&
        other.proyectowbe == proyectowbe &&
        other.comentario1 == comentario1 &&
        other.comentario2 == comentario2 &&
        other.e4e == e4e &&
        other.descripcion == descripcion &&
        other.um == um &&
        other.m01q1 == m01q1 &&
        other.m01q2 == m01q2 &&
        other.m01qx == m01qx &&
        other.m02q1 == m02q1 &&
        other.m02q2 == m02q2 &&
        other.m02qx == m02qx &&
        other.m03q1 == m03q1 &&
        other.m03q2 == m03q2 &&
        other.m03qx == m03qx &&
        other.m04q1 == m04q1 &&
        other.m04q2 == m04q2 &&
        other.m04qx == m04qx &&
        other.m05q1 == m05q1 &&
        other.m05q2 == m05q2 &&
        other.m05qx == m05qx &&
        other.m06q1 == m06q1 &&
        other.m06q2 == m06q2 &&
        other.m06qx == m06qx &&
        other.m07q1 == m07q1 &&
        other.m07q2 == m07q2 &&
        other.m07qx == m07qx &&
        other.m08q1 == m08q1 &&
        other.m08q2 == m08q2 &&
        other.m08qx == m08qx &&
        other.m09q1 == m09q1 &&
        other.m09q2 == m09q2 &&
        other.m09qx == m09qx &&
        other.m10q1 == m10q1 &&
        other.m10q2 == m10q2 &&
        other.m10qx == m10qx &&
        other.m11q1 == m11q1 &&
        other.m11q2 == m11q2 &&
        other.m11qx == m11qx &&
        other.m12q1 == m12q1 &&
        other.m12q2 == m12q2 &&
        other.m12qx == m12qx;
  }

  @override
  int get hashCode {
    return item.hashCode ^
        year.hashCode ^
        id.hashCode ^
        estado.hashCode ^
        estdespacho.hashCode ^
        tipo.hashCode ^
        fechainicial.hashCode ^
        fechacambio.hashCode ^
        fechasolicitud.hashCode ^
        unidad.hashCode ^
        codigo.hashCode ^
        proyecto.hashCode ^
        circuito.hashCode ^
        pm.hashCode ^
        solicitante.hashCode ^
        pdi.hashCode ^
        wbe.hashCode ^
        proyectowbe.hashCode ^
        comentario1.hashCode ^
        comentario2.hashCode ^
        e4e.hashCode ^
        descripcion.hashCode ^
        um.hashCode ^
        m01q1.hashCode ^
        m01q2.hashCode ^
        m01qx.hashCode ^
        m02q1.hashCode ^
        m02q2.hashCode ^
        m02qx.hashCode ^
        m03q1.hashCode ^
        m03q2.hashCode ^
        m03qx.hashCode ^
        m04q1.hashCode ^
        m04q2.hashCode ^
        m04qx.hashCode ^
        m05q1.hashCode ^
        m05q2.hashCode ^
        m05qx.hashCode ^
        m06q1.hashCode ^
        m06q2.hashCode ^
        m06qx.hashCode ^
        m07q1.hashCode ^
        m07q2.hashCode ^
        m07qx.hashCode ^
        m08q1.hashCode ^
        m08q2.hashCode ^
        m08qx.hashCode ^
        m09q1.hashCode ^
        m09q2.hashCode ^
        m09qx.hashCode ^
        m10q1.hashCode ^
        m10q2.hashCode ^
        m10qx.hashCode ^
        m11q1.hashCode ^
        m11q2.hashCode ^
        m11qx.hashCode ^
        m12q1.hashCode ^
        m12q2.hashCode ^
        m12qx.hashCode;
  }
}

import 'dart:convert';

class ProyectosReg {
  String id;
  String idsap;
  String nombrecorto;
  String proyecto;
  String subgerencia;
  String ir;
  String pe;
  String macroc;
  String pclusters;
  String irdes;
  ProyectosReg({
    required this.id,
    required this.idsap,
    required this.nombrecorto,
    required this.proyecto,
    required this.subgerencia,
    required this.ir,
    required this.pe,
    required this.macroc,
    required this.pclusters,
    required this.irdes,
  });

  List<String> toList() {
    return [
      id,
      idsap,
      nombrecorto,
      proyecto,
      subgerencia,
      ir,
      pe,
      macroc,
      pclusters,
      irdes,
    ];
  }

  ProyectosReg copyWith({
    String? id,
    String? idsap,
    String? nombrecorto,
    String? proyecto,
    String? subgerencia,
    String? ir,
    String? pe,
    String? macroc,
    String? pclusters,
    String? irdes,
  }) {
    return ProyectosReg(
      id: id ?? this.id,
      idsap: idsap ?? this.idsap,
      nombrecorto: nombrecorto ?? this.nombrecorto,
      proyecto: proyecto ?? this.proyecto,
      subgerencia: subgerencia ?? this.subgerencia,
      ir: ir ?? this.ir,
      pe: pe ?? this.pe,
      macroc: macroc ?? this.macroc,
      pclusters: pclusters ?? this.pclusters,
      irdes: irdes ?? this.irdes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idsap': idsap,
      'nombrecorto': nombrecorto,
      'proyecto': proyecto,
      'subgerencia': subgerencia,
      'ir': ir,
      'pe': pe,
      'macroc': macroc,
      'pclusters': pclusters,
      'irdes': irdes,
    };
  }

  factory ProyectosReg.fromMap(Map<String, dynamic> map) {
    return ProyectosReg(
      id: map['id'].toString(),
      idsap: map['idsap'].toString(),
      nombrecorto: map['nombrecorto'].toString(),
      proyecto: map['proyecto'].toString(),
      subgerencia: map['subgerencia'].toString(),
      ir: map['ir'].toString(),
      pe: map['pe'].toString(),
      macroc: map['macroc'].toString(),
      pclusters: map['pclusters'].toString(),
      irdes: map['irdes'].toString(),
    );
  }

  factory ProyectosReg.fromInit() {
    return ProyectosReg(
      id: '',
      idsap: '',
      nombrecorto: '',
      proyecto: '',
      subgerencia: '',
      ir: '',
      pe: '',
      macroc: '',
      pclusters: '',
      irdes: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProyectosReg.fromJson(String source) =>
      ProyectosReg.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProyectosReg(id: $id, idsap: $idsap, nombrecorto: $nombrecorto, proyecto: $proyecto, subgerencia: $subgerencia, ir: $ir, pe: $pe, macroc: $macroc)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProyectosReg &&
        other.id == id &&
        other.idsap == idsap &&
        other.nombrecorto == nombrecorto &&
        other.proyecto == proyecto &&
        other.subgerencia == subgerencia &&
        other.ir == ir &&
        other.pe == pe &&
        other.macroc == macroc;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        idsap.hashCode ^
        nombrecorto.hashCode ^
        proyecto.hashCode ^
        subgerencia.hashCode ^
        ir.hashCode ^
        pe.hashCode ^
        macroc.hashCode;
  }
}

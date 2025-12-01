import 'dart:convert';

class SustitutosReg {
  String id;
  String proyectoviejo;
  String idproyecto;
  SustitutosReg({
    required this.id,
    required this.proyectoviejo,
    required this.idproyecto,
  });

  SustitutosReg copyWith({
    String? id,
    String? proyectoviejo,
    String? idproyecto,
  }) {
    return SustitutosReg(
      id: id ?? this.id,
      proyectoviejo: proyectoviejo ?? this.proyectoviejo,
      idproyecto: idproyecto ?? this.idproyecto,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'proyectoviejo': proyectoviejo,
      'idproyecto': idproyecto,
    };
  }

  factory SustitutosReg.fromMap(Map<String, dynamic> map) {
    return SustitutosReg(
      id: map['id'].toString(),
      proyectoviejo: map['proyectoviejo'].toString(),
      idproyecto: map['idproyecto'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory SustitutosReg.fromJson(String source) => SustitutosReg.fromMap(json.decode(source));

  @override
  String toString() => 'SustitutosReg(id: $id, proyectoviejo: $proyectoviejo, idproyecto: $idproyecto)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SustitutosReg &&
      other.id == id &&
      other.proyectoviejo == proyectoviejo &&
      other.idproyecto == idproyecto;
  }

  @override
  int get hashCode => id.hashCode ^ proyectoviejo.hashCode ^ idproyecto.hashCode;
}

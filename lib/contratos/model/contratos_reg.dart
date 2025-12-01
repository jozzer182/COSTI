import 'dart:convert';

class ContratosReg {
  String id;
  String especialidad;
  String contratos;
  String objeto;
  String proveedor;
  ContratosReg({
    required this.id,
    required this.especialidad,
    required this.contratos,
    required this.objeto,
    required this.proveedor,
  });

  List<String> toList() {
    return [
      id,
      especialidad,
      contratos,
      objeto,
      proveedor,
    ];
  }

  ContratosReg copyWith({
    String? id,
    String? especialidad,
    String? contratos,
    String? objeto,
    String? proveedor,
  }) {
    return ContratosReg(
      id: id ?? this.id,
      especialidad: especialidad ?? this.especialidad,
      contratos: contratos ?? this.contratos,
      objeto: objeto ?? this.objeto,
      proveedor: proveedor ?? this.proveedor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'especialidad': especialidad,
      'contratos': contratos,
      'objeto': objeto,
      'proveedor': proveedor,
    };
  }

  factory ContratosReg.fromMap(Map<String, dynamic> map) {
    return ContratosReg(
      id: map['id'].toString(),
      especialidad: map['especialidad'].toString(),
      contratos: map['contratos'].toString(),
      objeto: map['objeto'].toString(),
      proveedor: map['proveedor'].toString(),
    );
  }

  factory ContratosReg.fromInit() {
    return ContratosReg(
      id: '',
      especialidad: '',
      contratos: '',
      objeto: '',
      proveedor: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ContratosReg.fromJson(String source) =>
      ContratosReg.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ContratosReg(id: $id, especialidad: $especialidad, contratos: $contratos, objeto: $objeto, proveedor: $proveedor)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ContratosReg &&
        other.id == id &&
        other.especialidad == especialidad &&
        other.contratos == contratos &&
        other.objeto == objeto &&
        other.proveedor == proveedor;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        especialidad.hashCode ^
        contratos.hashCode ^
        objeto.hashCode ^
        proveedor.hashCode;
  }
}

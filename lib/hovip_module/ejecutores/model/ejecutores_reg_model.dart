import 'dart:convert';

class EjecutoresReg {
  String id;
  String area;
  String controller;
  String pm;
  String idproyecto;
  String proyecto;
  String funcional1;
  String funcional2;
  String funcional3;
  String funcional4;
  String funcional5;
  String funcional6;
  String razon;
  String fecha;
  String persona;
  EjecutoresReg({
    required this.id,
    required this.area,
    required this.controller,
    required this.pm,
    required this.idproyecto,
    required this.proyecto,
    required this.funcional1,
    required this.funcional2,
    required this.funcional3,
    required this.funcional4,
    required this.funcional5,
    required this.funcional6,
    required this.razon,
    required this.fecha,
    required this.persona,
  });

  List<String> toList() {
    return [
      id,
      area,
      controller,
      pm,
      idproyecto,
      proyecto,
      funcional1,
      funcional2,
      funcional3,
      funcional4,
      funcional5,
      funcional6,
      razon,
      fecha,
      persona,
    ];
  }

  List<String> get funcionales {
    return [
      funcional1.toUpperCase(),
      funcional2.toUpperCase(),
      funcional3.toUpperCase(),
      funcional4.toUpperCase(),
      funcional5.toUpperCase(),
      funcional6.toUpperCase(),
    ];
  }

  EjecutoresReg copyWith({
    String? id,
    String? area,
    String? controller,
    String? pm,
    String? idproyecto,
    String? proyecto,
    String? funcional1,
    String? funcional2,
    String? funcional3,
    String? funcional4,
    String? funcional5,
    String? funcional6,
    String? razon,
    String? fecha,
    String? persona,
  }) {
    return EjecutoresReg(
      id: id ?? this.id,
      area: area ?? this.area,
      controller: controller ?? this.controller,
      pm: pm ?? this.pm,
      idproyecto: idproyecto ?? this.idproyecto,
      proyecto: proyecto ?? this.proyecto,
      funcional1: funcional1 ?? this.funcional1,
      funcional2: funcional2 ?? this.funcional2,
      funcional3: funcional3 ?? this.funcional3,
      funcional4: funcional4 ?? this.funcional4,
      funcional5: funcional5 ?? this.funcional5,
      funcional6: funcional6 ?? this.funcional6,
      razon: razon ?? this.razon,
      fecha: fecha ?? this.fecha,
      persona: persona ?? this.persona,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'area': area,
      'controller': controller,
      'pm': pm,
      'idproyecto': idproyecto,
      'proyecto': proyecto,
      'funcional1': funcional1,
      'funcional2': funcional2,
      'funcional3': funcional3,
      'funcional4': funcional4,
      'funcional5': funcional5,
      'funcional6': funcional6,
      'razon': razon,
      'fecha': fecha,
      'persona': persona,
    };
  }

  factory EjecutoresReg.fromMap(Map<String, dynamic> map) {
    return EjecutoresReg(
      id: map['id'].toString(),
      area: map['area'].toString(),
      controller: map['controller'].toString(),
      pm: map['pm'].toString(),
      idproyecto: map['idproyecto'].toString(),
      proyecto: map['proyecto'].toString(),
      funcional1: map['funcional1'].toString(),
      funcional2: map['funcional2'].toString(),
      funcional3: map['funcional3'].toString(),
      funcional4: map['funcional4'].toString(),
      funcional5: map['funcional5'].toString(),
      funcional6: map['funcional6'].toString(),
      razon: map['razon'].toString(),
      fecha: map['fecha'].toString(),
      persona: map['persona'].toString(),
    );
  }

  factory EjecutoresReg.fromInit() {
    return EjecutoresReg(
      id: '',
      area: '',
      controller: '',
      pm: '',
      idproyecto: '',
      proyecto: '',
      funcional1: '',
      funcional2: '',
      funcional3: '',
      funcional4: '',
      funcional5: '',
      funcional6: '',
      razon: '',
      fecha: '',
      persona: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EjecutoresReg.fromJson(String source) =>
      EjecutoresReg.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EjecutoresReg(id: $id, area: $area, controller: $controller, pm: $pm, funcional: $funcional1, idproyecto: $idproyecto, proyecto: $proyecto, fecha: $fecha, persona: $persona)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EjecutoresReg &&
        other.id == id &&
        other.area == area &&
        other.controller == controller &&
        other.pm == pm &&
        other.funcional1 == funcional1 &&
        other.idproyecto == idproyecto &&
        other.proyecto == proyecto &&
        other.fecha == fecha &&
        other.persona == persona;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        area.hashCode ^
        controller.hashCode ^
        pm.hashCode ^
        funcional1.hashCode ^
        idproyecto.hashCode ^
        proyecto.hashCode ^
        fecha.hashCode ^
        persona.hashCode;
  }
}

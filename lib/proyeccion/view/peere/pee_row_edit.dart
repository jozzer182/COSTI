import 'package:collection/collection.dart';
import 'package:costii/proyeccion/view/peere/pee_row_edit_contrato.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../bloc/main_bloc.dart';
import '../../../live/model/live_reg.dart';
import '../../../real/model/real_esp_reg.dart';
import '../../model/proyeccion_reg_esp.dart';
import 'pee_row_edit_field.dart';

class PeeRowEdit extends StatefulWidget {
  final int index;
  final bool esProyecto;
  final String naturaleza;
  final String especialidad;
  const PeeRowEdit(
    this.index, {
    required this.esProyecto,
    this.naturaleza = '',
    this.especialidad = '',
    super.key,
  });

  @override
  State<PeeRowEdit> createState() => _PeeRowEditState();
}

class _PeeRowEditState extends State<PeeRowEdit> {
  late ProyeccionRegEsp reg;
  late RealEspReg realEsp;
  final NumberFormat currencyFormat = NumberFormat.decimalPattern('es_ES');
  late LiveReg liveReg;
  int flex = 4;
  bool isOut = false;
  @override
  void initState() {
    List<ProyeccionRegEsp> list = context.read<MainBloc>().state.pEdit!.list;
    if (widget.naturaleza.isNotEmpty) {
      list = list.where((e) => e.naturaleza == widget.naturaleza).toList();
    }
    if (widget.especialidad.isNotEmpty) {
      list = list.where((e) => e.especialidad == widget.especialidad).toList();
    }
    if (widget.index < list.length) {
      reg = list[widget.index];
    } else {
      reg = ProyeccionRegEsp.fromInit();
      isOut = true;
    }
    liveReg = context.read<MainBloc>().state.liveList?.list.firstWhereOrNull(
            (e) =>
                reg.idproy == e.proyectosReg.id &&
                reg.naturaleza.toUpperCase() == e.naturaleza.toUpperCase()) ??
        LiveReg();
    realEsp = liveReg.especialidadList
            .firstWhereOrNull((e) => e.especialidad == reg.especialidad) ??
        RealEspReg();
    if (!widget.esProyecto) flex = 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isOut) {
      return Text(widget.index.toString());
    }
    return Row(
      key: UniqueKey(),
      children: [
        if (!widget.esProyecto)
          Expanded(
            flex: 5,
            child: Text(
              reg.proyecto,
              textAlign: TextAlign.center,
            ),
          ),
        Expanded(
          flex: flex,
          child: Text(
            reg.naturaleza,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: flex,
          child: Text(
            reg.especialidad,
            textAlign: TextAlign.center,
          ),
        ),
        PEEREContrato(
          widget.index,
          esProyecto: widget.esProyecto,
          realEsp: realEsp,
        ),
        for (int i in List.generate(12, (i) => i + 1))
          PeeRowEditField(
            key: UniqueKey(),
            reg: reg,
            i: i,
            live: liveReg,
            realEsp: realEsp,
          ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.message),
          color: reg.comentario.isEmpty ? null : Colors.purple,
        ),
      ],
    );
  }
}

import 'package:collection/collection.dart';
import 'package:costii/proyeccion/view/peere/pee_page.dart';
import 'package:costii/proyeccion/view/proyeccion_esp_page.dart';
import 'package:costii/real/view/real_page.dart';
import 'package:costii/resources/constants/colors_const.dart';
import 'package:costii/resources/constants/meses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../bloc/main_bloc.dart';
import '../../proyeccion/model/proyeccion_reg_esp.dart';
import '../../resources/transicion_pagina.dart';
import '../model/live_reg.dart';

class LiveRow extends StatefulWidget {
  final LiveReg liveReg;
  final bool revisar;
  const LiveRow({
    required this.liveReg,
    required this.revisar,
    super.key,
  });

  @override
  State<LiveRow> createState() => _LiveRowState();
}

class _LiveRowState extends State<LiveRow> {
  late bool check;
  late LiveReg liveReg;
  Color colorBdg = colorCUS;
  String revisado = '';
  @override
  void initState() {
    liveReg = widget.liveReg;
    if (liveReg.proyectosReg.macroc.toUpperCase().contains("DEV")) {
      colorBdg = colorDEV;
    }
    if (liveReg.proyectosReg.macroc.toUpperCase().contains("MAN")) {
      colorBdg = colorMAN;
    }
    check =
        liveReg.proyeccionEsp.any((e) => e.revisado.toUpperCase() == 'TRUE');
    if (check) {
      ProyeccionRegEsp regEsp = liveReg.proyeccionEsp
              .firstWhereOrNull((e) => e.revisado.toUpperCase() == 'TRUE') ??
          ProyeccionRegEsp.fromInit();
      String fecha = regEsp.revisadofecha;
      if (fecha.length > 16) fecha = fecha.substring(0, 16);
      revisado = '${regEsp.revisadopor} - $fecha';
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void goTo(Widget page) => Navigator.push(context, createRoute(page));
    return Row(
      key: UniqueKey(),
      children: [
        Expanded(
          flex: 7,
          child: SelectableRegion(
            focusNode: FocusNode(),
            selectionControls: EmptyTextSelectionControls(),
            child: Column(
              children: [
                Text(
                  liveReg.proyecto,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: liveReg.colorTexto,
                  ),
                ),
                const Gap(2),
                Text(
                  liveReg.ejecutoresReg.pm.isEmpty
                      ? 'sin PM'
                      : liveReg.ejecutoresReg.pm,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: liveReg.colorTexto,
                    fontSize: 11,
                  ),
                ),
                const Gap(5),
                Text(
                  liveReg.proyectosReg.macroc,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colorBdg,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  liveReg.naturaleza,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: liveReg.colorTexto,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              if (revisado.isNotEmpty)
                Tooltip(
                  message: revisado,
                  child: Checkbox(
                    value: check,
                    onChanged: widget.revisar
                        ? (v) {
                            if (v != null) {
                              context
                                  .read<MainBloc>()
                                  .proyeccionEspEdit
                                  .liveEdit
                                  .cambiarCheck(liveReg);
                              setState(() {
                                check = v;
                              });
                            }
                          }
                        : null,
                  ),
                ),
              if (revisado.isEmpty)
                Checkbox(
                  value: check,
                  onChanged: widget.revisar
                      ? (v) {
                          if (v != null) {
                            context
                                .read<MainBloc>()
                                .proyeccionEspEdit
                                .liveEdit
                                .cambiarCheck(liveReg);
                            setState(() {
                              check = v;
                            });
                          }
                        }
                      : null,
                ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'PROY',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: liveReg.colorTexto,
                    ),
                  ),
                  const Gap(5),
                  Text(
                    'REAL',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: liveReg.colorTextoReal,
                    ),
                  ),
                  const Gap(5),
                  Text(
                    'BDG',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: colorBdg,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        for (int mes in meses)
          Expanded(
            flex: liveReg.liveCeldas[mes]?.flex ?? 1,
            child: Card(
              child: Column(
                children: [
                  InkWell(
                    onTap: (liveReg.proyCeldas[mes]?.valor ?? '') == '-'
                        ? null
                        : () {
                            goTo(
                              ProyeccionEspPage(
                                idProy: liveReg.proyectosReg.id,
                                naturaleza: liveReg.naturaleza,
                              ),
                            );
                          },
                    child: Text(
                      liveReg.proyCeldas[mes]?.valor ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: liveReg.proyCeldas[mes]?.color,
                      ),
                    ),
                  ),
                  const Gap(5),
                  InkWell(
                    onTap: (liveReg.realCeldas[mes]?.valor ?? '').isEmpty
                        ? null
                        : () {
                            goTo(
                              RealPage(
                                proyecto: liveReg.proyectosReg.nombrecorto,
                                naturaleza: liveReg.naturaleza.substring(0, 3),
                              ),
                            );
                          },
                    child: Text(
                      liveReg.realCeldas[mes]?.valor ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: liveReg.realCeldas[mes]?.color,
                      ),
                    ),
                  ),
                  const Gap(5),
                  Text(
                    liveReg.bdgCeldas[mes]?.valor ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: colorBdg,
                      // color: liveReg.bdgCeldas[mes]?.color,
                    ),
                  ),
                ],
              ),
            ),
          ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Text(
                liveReg.totalProy,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: liveReg.colorTexto,
                ),
              ),
              const Gap(5),
              Text(
                liveReg.totalReal,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: liveReg.colorTextoReal,
                ),
              ),
              const Gap(5),
              Text(
                liveReg.totalBDGString,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: colorBdg,
                ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.revisar && liveReg.comentarios == null)
              const SizedBox(width: 40),
            if (!widget.revisar)
              IconButton(
                onPressed: () {
                  context
                      .read<MainBloc>()
                      .proyeccionEspEdit
                      .create(liveReg.proyectosReg.id);
                  goTo(const ProyeccionEspEdicionPage(esProyecto: true));
                },
                icon: const Icon(Icons.edit),
              ),
            if (liveReg.comentarios != null)
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Comentarios'),
                        content: Text(liveReg.comentarios ?? ''),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancelar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.message),
              ),
          ],
        ),
      ],
    );
  }
}

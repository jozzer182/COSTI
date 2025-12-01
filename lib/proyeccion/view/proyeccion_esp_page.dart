import 'package:collection/collection.dart';
import 'package:costii/proyeccion/model/proyeccion_reg_esp.dart';
import 'package:costii/resources/constants/meses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../bloc/main_bloc.dart';
import '../../live/model/live_reg.dart';
import '../../real/model/real_esp_reg.dart';
import '../../real/model/real_reg.dart';
import '../../resources/a_entero_2.dart';
import '../../resources/constants/years.dart';
import '../../resources/descarga_hojas.dart';
import '../../resources/titulo.dart';
import '../../resources/transicion_pagina.dart';
import 'peere/pee_page.dart';

class ProyeccionEspPage extends StatefulWidget {
  final String idProy;
  final String naturaleza;
  const ProyeccionEspPage({
    required this.idProy,
    required this.naturaleza,
    super.key,
  });

  @override
  State<ProyeccionEspPage> createState() => _ProyeccionEspPageState();
}

class _ProyeccionEspPageState extends State<ProyeccionEspPage> {
  String filter = '';
  String idproy = '';
  String naturaleza = '';
  int endList = 70;
  final ScrollController _controller = ScrollController();
  List<LiveReg> liveList = [];
  List<ProyeccionRegEsp> valores = [];
  _onScroll() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        endList += 70;
      });
    }
  }

  @override
  void initState() {
    idproy = widget.idProy;
    print('idproy: $idproy');
    naturaleza = widget.naturaleza;
    _controller.addListener(_onScroll);
    liveList = context.read<MainBloc>().state.liveList?.list ?? [];
    valores = context.read<MainBloc>().state.proyeccionList?.listEsp ?? [];
    for (var reg in valores) {
      RealEspReg realEspReg = liveList
              .firstWhereOrNull((e) =>
                  e.proyectosReg.id == reg.idproy &&
                  e.naturaleza.toUpperCase() == reg.naturaleza.toUpperCase())
              ?.especialidadList
              .firstWhereOrNull((e) => e.especialidad == reg.especialidad) ??
          RealEspReg();
      List<RealReg> list = realEspReg.list;
      List<String> contratos =
          list.map((e) => e.contratomarco).toSet().toList();
      contratos.removeWhere((e) => e.isEmpty);
      if (reg.contrato.isEmpty) {
        reg.contrato = contratos.join(',');
      } else {
        reg.contrato = '${reg.contrato},${contratos.join(',')}';
      }
      if (liveList.isNotEmpty) {
        for (var mes in meses) {
          if (!liveList.first.getActiveByMonth(mes)) {
            reg.setMes(mes, realEspReg.mes(mes));
          }
        }
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state.proyeccionList == null) {
          return const Center(child: CircularProgressIndicator());
        }
        String proyecto = "";
        List<ToCelda> titulos = state.proyeccionList?.celdasEsp ?? [];
        // List<ProyeccionRegEsp> valores = state.proyeccionList?.listEsp ?? [];
        valores = valores
            .where((e) => e.year == aEntero(state.year))
            .where(
              (e) => e.toList().any(
                    (e) => e.toLowerCase().contains(filter.toLowerCase()),
                  ),
            )
            .toList();
        // print('PROYECCION ESP, VALORES ANTES DE FILTRO: ${valores.length}');

        if (naturaleza.isNotEmpty && idproy.isNotEmpty) {
          valores = valores
              .where(
                (e) => e.naturaleza.toUpperCase() == naturaleza.toUpperCase(),
              )
              .where(
                (e) => e.idproy == idproy,
              )
              .toList();
          proyecto = state.proyectosList?.list
                  .firstWhere((e) => e.id == idproy)
                  .proyecto ??
              "";
          // print('naturaleza: $naturaleza, idproy: $idproy');
          // print('PROYECCION ESP, VALORES DESPUES DE FILTRO: ${valores.length}');
        }
        List<ProyeccionRegEsp> valoresToShow = [];
        if (valores.length > endList) {
          valoresToShow = valores.sublist(0, endList);
        } else {
          valoresToShow = valores;
        }
        void goTo(Widget page) => Navigator.push(context, createRoute(page));

        return Scaffold(
          appBar: AppBar(
            title:
                Text("$proyecto | Proyección Especialidad (Millones de pesos)"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  context.read<MainBloc>().proyeccionEspEdit.create(
                        idproy,
                      );
                  goTo(const ProyeccionEspEdicionPage(
                    esProyecto: true,
                  ));
                },
                child: const Text('Editar'),
              ),
              const Gap(5),
              ElevatedButton(
                onPressed: () {
                  print(
                      'state.vistaContratoList!.list ${state.proyeccionList!.list.length}');
                  List<Map<String, dynamic>> datos = valores
                      // .vistaContratoList!.list
                      .map((e) => e.toMap())
                      .toList();
                  // print(jsonEncode(datos));
                  DescargaHojas().ahoraMap(
                    datos: datos,
                    nombre: "PROYECCIÓN ESPECIALIDAD",
                  );
                },
                child: const Text(
                  'Descargar',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: state.year,
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            context.read<MainBloc>().setYear(newValue);
                          }
                        },
                        items: years
                            .map<DropdownMenuItem<String>>(
                              (String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ),
                            )
                            .toList(),
                        decoration: const InputDecoration(
                          labelText: 'Año',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const Gap(10),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            filter = value;
                            naturaleza = "";
                            idproy = "";
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Búsqueda',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(10),
                Row(
                  children: [
                    // const SizedBox(
                    //   width: 32,
                    // ),
                    for (ToCelda celda in titulos)
                      Expanded(
                        key: UniqueKey(),
                        flex: celda.flex,
                        child: Text(
                          celda.valor,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
                const Gap(5),
                Expanded(
                  child: SelectableRegion(
                    focusNode: FocusNode(),
                    selectionControls: emptyTextSelectionControls,
                    child: ListView.builder(
                      controller: _controller,
                      itemCount: valoresToShow.length,
                      itemBuilder: (c, index) {
                        void goTo(Widget page) =>
                            Navigator.push(context, createRoute(page));

                        return InkWell(
                          onTap: () {},
                          child: Row(
                            key: UniqueKey(),
                            children: [
                              for (ToCelda celda in valoresToShow[index].celdas)
                                Expanded(
                                  flex: celda.flex,
                                  child: Text(
                                    celda.valor,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: celda.color,
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

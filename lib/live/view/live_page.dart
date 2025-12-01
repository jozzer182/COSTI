import 'package:costii/proyeccion/view/peere/pee_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../bloc/main_bloc.dart';
import '../../resources/constants/years.dart';
import '../../resources/descarga_hojas.dart';
import '../../resources/titulo.dart';
import '../../resources/transicion_pagina.dart';
import '../model/live_reg.dart';
import 'live_acumrow.dart';
import 'live_row.dart';

class LivePage extends StatefulWidget {
  final String area;
  final String pm;
  const LivePage({
    this.area = '',
    this.pm = '',
    super.key,
  });

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  String filter = '';
  String pm = '';
  String macroc = '';
  int endList = 70;
  String area = '';
  List<String> areas = [];
  List<ToCelda> titulos = [];
  List<String> pms = [];
  List<String> macrocs = [];
  bool revisar = false;
  bool hideOtros = true;
  final ScrollController _controller = ScrollController();
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
    _controller.addListener(_onScroll);
    areas = context
            .read<MainBloc>()
            .state
            .liveList
            ?.list
            .map(
              (e) => e.area,
            )
            .toSet()
            .toList() ??
        [];
    areas.sort();
    areas.add('');
    area = widget.area;
    pm = widget.pm;
    if (areas.isNotEmpty && area.isEmpty && pm.isEmpty) area = areas.first;
    titulos = context.read<MainBloc>().state.liveList?.celdas ?? [];
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void goTo(Widget page) => Navigator.push(context, createRoute(page));
    return BlocBuilder<MainBloc, MainState>(
      buildWhen: (previous, current) => previous.liveList != current.liveList,
      builder: (context, state) {
        if (state.liveList == null) {
          return const Center(child: CircularProgressIndicator());
        }
        List<LiveReg> valores = [];
        valores = state.liveList?.list ?? [];
        valores = valores.where((e) => e.area.contains(area)).toList();
        valores = valores
            .where((e) => e
                .toList()
                .any((el) => el.toUpperCase().contains(filter.toUpperCase())))
            .toList();

        if (pm.isNotEmpty) {
          valores = valores
              .where(
                  (e) => e.ejecutoresReg.pm.toUpperCase() == pm.toUpperCase())
              .toList();
        }
        if (pm.isEmpty || widget.pm.isNotEmpty) {
          pms = valores
              .map((e) => e.ejecutoresReg.pm.toUpperCase())
              .toSet()
              .toList();
          pms.sort();
        }

        if (macroc.isNotEmpty) {
          valores = valores
              .where((e) =>
                  e.proyectosReg.macroc.toUpperCase() == macroc.toUpperCase())
              .toList();
        }
        if (macroc.isEmpty) {
          macrocs = valores
              .map((e) => e.proyectosReg.macroc.toUpperCase())
              .toSet()
              .toList();
          macrocs.sort();
          if (!macrocs.contains('')) macrocs.add('');
        }
        if (hideOtros) {
          valores =
              valores.where((e) => e.naturaleza != "Otros Costos").toList();
        }

        // List<LiveReg> valoresToShow = [];
        // if (valores.length > endList) {
        //   valoresToShow = valores.sublist(0, endList);
        // } else {
        //   valoresToShow = valores;
        // }

        return Scaffold(
          appBar: AppBar(
            title: const Text("LIVE (Millones de pesos)"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    hideOtros = !hideOtros;
                  });
                },
                child: Text(
                  hideOtros?'Mostrar\nOtros Costos':'Ocultar\nOtros Costos',
                  textAlign: TextAlign.center,
                ),
              ),
              if (revisar)
                ElevatedButton(
                  onPressed: () {
                    //guardar
                    context.read<MainBloc>().proyeccionEspEdit.save;
                    while (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text(
                    "Guardar",
                    textAlign: TextAlign.center,
                  ),
                ),
              const Gap(5),
              ElevatedButton(
                onPressed: () {
                  context
                      .read<MainBloc>()
                      .proyeccionEspEdit
                      .liveEdit
                      .crear(valores);
                  setState(() {
                    revisar = !revisar;
                  });
                  if (!revisar) goTo(const LivePage());
                },
                child: Text(
                  revisar ? "Cancelar" : "Revisar",
                  textAlign: TextAlign.center,
                ),
              ),
              const Gap(5),
              if (!revisar)
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<MainBloc>()
                        .proyeccionEspEdit
                        .createWithList(valores);
                    goTo(const ProyeccionEspEdicionPage(esProyecto: false));
                  },
                  child: const Text(
                    "Editar\nMasivo",
                    textAlign: TextAlign.center,
                  ),
                ),
              const Gap(5),
              if (!revisar)
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
                      nombre: "LIVE",
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
                if (!revisar)
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
                        flex: 2,
                        child: DropdownButtonFormField<String>(
                          value: area,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                area = newValue;
                                pm = '';
                              });
                            }
                          },
                          items: areas
                              .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ),
                              )
                              .toList(),
                          decoration: const InputDecoration(
                            labelText: 'Área',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        flex: 2,
                        child: LayoutBuilder(
                          builder: (contect, constraints) {
                            return DropdownButtonFormField<String>(
                              value: pm.isEmpty ? null : pm,
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    pm = newValue;
                                  });
                                }
                              },
                              items: pms
                                  .map<DropdownMenuItem<String>>(
                                    (String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  )
                                  .toList(),
                              decoration: const InputDecoration(
                                labelText: 'PM',
                                border: OutlineInputBorder(),
                              ),
                              selectedItemBuilder: (BuildContext context) {
                                return pms.map<Widget>((String value) {
                                  return SizedBox(
                                    width: constraints.maxWidth -
                                        50, // Usa el ancho disponible
                                    child: Text(
                                      value,
                                      overflow: TextOverflow
                                          .ellipsis, // Trunca el texto si es demasiado largo
                                    ),
                                  );
                                }).toList();
                              },
                            );
                          },
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        flex: 2,
                        child: LayoutBuilder(
                          builder: (contect, constraints) {
                            return DropdownButtonFormField<String>(
                              value: macroc.isEmpty ? null : macroc,
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    macroc = newValue;
                                  });
                                }
                              },
                              items: macrocs
                                  .map<DropdownMenuItem<String>>(
                                    (String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  )
                                  .toList(),
                              decoration: const InputDecoration(
                                labelText: 'Macro Categoría',
                                border: OutlineInputBorder(),
                              ),
                              selectedItemBuilder: (BuildContext context) {
                                return macrocs.map<Widget>((String value) {
                                  return SizedBox(
                                    width: constraints.maxWidth -
                                        50, // Usa el ancho disponible
                                    child: Text(
                                      value,
                                      overflow: TextOverflow
                                          .ellipsis, // Trunca el texto si es demasiado largo
                                    ),
                                  );
                                }).toList();
                              },
                            );
                          },
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        flex: 3,
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              filter = value;
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: LiveAcumRow(
                    liveList: valores,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
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
                      const Gap(40),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    // controller: _controller,
                    itemCount: valores.length,
                    itemBuilder: (c, index) {
                      print('valores.length: ${valores.length}');
                      return Card(
                        color: Theme.of(context).colorScheme.background,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: LiveRow(
                            liveReg: valores[index],
                            revisar: revisar,
                            key: UniqueKey(),
                          ),
                        ),
                      );
                    },
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

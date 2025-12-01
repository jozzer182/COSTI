import 'package:costii/hovip_module/hovip/view/proyecto_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../bloc/main_bloc.dart';
import '../../../resources/descarga_hojas.dart';
import '../../../resources/titulo.dart';
import '../../../resources/transicion_pagina.dart';
import '../model/hovip_reg_model.dart';

class HovipProyectosPage extends StatefulWidget {
  const HovipProyectosPage({super.key});

  @override
  State<HovipProyectosPage> createState() => _HovipProyectosPageState();
}

class _HovipProyectosPageState extends State<HovipProyectosPage> {
  String filter = '';
  int endList = 70;
  List<String> subgerencias = [
    "C. Eng",
    "ND",
    "O&M",
    "Op Regional A",
    "PM&C",
  ];
  String subgerenciaSeleccionada = "PM&C";
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
        if (state.bdgList == null) {
          return const Center(child: CircularProgressIndicator());
        }
        List<ToCelda> titulos = state.hovipList?.celdas ?? [];
        List<HovipReg> valores = state.hovipList?.list ?? [];
        valores = valores
            .where(
                (e) => e.proyecto.subgerencia.contains(subgerenciaSeleccionada))
            .where(
              (e) => e.toList().any(
                    (e) => e.toLowerCase().contains(filter.toLowerCase()),
                  ),
            )
            .toList();
        List<HovipReg> valoresToShow = [];
        if (valores.length > endList) {
          valoresToShow = valores.sublist(0, endList);
        } else {
          valoresToShow = valores;
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text("HOJA DE VIDA DE PROYECTOS (HOVIP)"),
            actions: [
              const Gap(5),
              ElevatedButton(
                onPressed: () {
                  print(
                      'state.vistaContratoList!.list ${state.bdgList!.list.length}');
                  List<Map<String, dynamic>> datos = valores
                      // .vistaContratoList!.list
                      .map((e) => e.toMap())
                      .toList();
                  // print(jsonEncode(datos));
                  DescargaHojas().ahoraMap(
                    datos: datos,
                    nombre: "HOVIP",
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
                        value: subgerenciaSeleccionada,
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              subgerenciaSeleccionada = newValue.toString();
                            });
                          }
                        },
                        items: subgerencias
                            .map<DropdownMenuItem<String>>(
                              (String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ),
                            )
                            .toList(),
                        decoration: const InputDecoration(
                          labelText: 'Subgerencia',
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
                          onTap: () {
                            context
                                .read<MainBloc>()
                                .hovipRegController
                                .set(valoresToShow[index]);
                            goTo(const HovipProyectoPage());
                          },
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../bloc/main_bloc.dart';
import '../../resources/a_entero_2.dart';
import '../../resources/constants/years.dart';
import '../../resources/descarga_hojas.dart';
import '../../resources/titulo.dart';
import '../../resources/transicion_pagina.dart';
import '../model/proyeccion_reg.dart';
import 'proyeccion_esp_page.dart';

class ProyeccionPage extends StatefulWidget {
  const ProyeccionPage({super.key});

  @override
  State<ProyeccionPage> createState() => _ProyeccionPageState();
}

class _ProyeccionPageState extends State<ProyeccionPage> {
  String filter = '';
  int endList = 70;
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
    void goTo(Widget page) => Navigator.push(context, createRoute(page));

    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state.proyeccionList == null) {
          return const Center(child: CircularProgressIndicator());
        }
        List<ToCelda> titulos = state.proyeccionList?.celdas ?? [];
        List<ProyeccionReg> valores = state.proyeccionList?.list ?? [];
        valores = valores
            .where((e) => e.year == aEntero(state.year))
            .where(
              (e) => e.toList().any(
                    (e) => e.toLowerCase().contains(filter.toLowerCase()),
                  ),
            )
            .toList();
        List<ProyeccionReg> valoresToShow = [];
        if (valores.length > endList) {
          valoresToShow = valores.sublist(0, endList);
        } else {
          valoresToShow = valores;
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text("Proyección (Millones de pesos)"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  goTo(
                    ProyeccionEspPage(
                      idProy: '',
                      naturaleza: '',
                    ),
                  );
                },
                child: Text('Todos'),
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
                    nombre: "PROYECCIÓN",
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
                        return InkWell(
                          onTap: () {
                            goTo(
                              ProyeccionEspPage(
                                naturaleza: valoresToShow[index].naturaleza,
                                idProy: valoresToShow[index].idproy,
                              ),
                            );
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

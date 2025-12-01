import 'package:costii/real/model/real_reg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../bloc/main_bloc.dart';
import '../../resources/descarga_hojas.dart';
import '../../resources/titulo.dart';
import '../../resources/transicion_pagina.dart';

class RealPage extends StatefulWidget {
  final String proyecto;
  final String naturaleza;
  const RealPage({
    required this.proyecto,
    required this.naturaleza,
    super.key,
  });

  @override
  State<RealPage> createState() => _RealPageState();
}

class _RealPageState extends State<RealPage> {
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
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state.realList == null) {
          return const Center(child: CircularProgressIndicator());
        }
        List<ToCelda> titulos = state.realList?.celdas ?? [];
        List<RealReg> valores = state.realList?.list ?? [];
        valores = valores
            .where(
              (e) => e.toList().any(
                    (e) => e.toLowerCase().contains(filter.toLowerCase()),
                  ),
            )
            .toList();
        // print("proyecto:${widget.proyecto}, naturaleza:${widget.naturaleza}");
        valores = valores
            .where((e) => e.proyecto.toUpperCase().contains(
                  widget.proyecto.toUpperCase(),
                ))
            .where((e) => e.naturaleza.toUpperCase().contains(
                  widget.naturaleza.toUpperCase(),
                ))
            .toList();
        List<RealReg> valoresToShow = [];
        if (valores.length > endList) {
          valoresToShow = valores.sublist(0, endList);
        } else {
          valoresToShow = valores;
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text("REAL - DETALLE (Millones de pesos)"),
            actions: [
              const Gap(5),
              ElevatedButton(
                onPressed: () {
                  print(
                      'state.vistaContratoList!.list ${state.realList!.list.length}');
                  List<Map<String, dynamic>> datos = valores
                      // .vistaContratoList!.list
                      .map((e) => e.toMap())
                      .toList();
                  // print(jsonEncode(datos));
                  DescargaHojas().ahoraMap(
                    datos: datos,
                    nombre: "REAL",
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
                                      fontSize: 12,
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

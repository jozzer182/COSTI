import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../bloc/main_bloc.dart';
import '../../live/model/live_reg.dart';
import '../../resources/constants/years.dart';
import '../../resources/descarga_hojas.dart';
import '../../resources/legend_widget.dart';
// import '../../resources/titulo.dart';
import 'grafica_linea.dart';

class GraficaPage extends StatefulWidget {
  const GraficaPage({super.key});

  @override
  State<GraficaPage> createState() => _GraficaPageState();
}

class _GraficaPageState extends State<GraficaPage> {
  String filter = '';
  int endList = 70;
  String area = '';
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
        if (state.liveList == null) {
          return const Center(child: CircularProgressIndicator());
        }
        // List<ToCelda> titulos = state.liveList?.celdas ?? [];
        List<LiveReg> valores = state.liveList?.list ?? [];
        List<String> areas =
            valores.map((e) => e.area).toSet().toList();
        areas.add('');
        valores = valores
            .where((e) => e.year.contains(state.year))
            .where(
              (e) => e.toList().any(
                    (e) => e.toLowerCase().contains(filter.toLowerCase()),
                  ),
            )
            .toList();
        // if (areas.isNotEmpty && area.isEmpty) {
        //   area = areas.first;
        // }
        valores = valores
            .where((e) => area.isEmpty ? true : e.area == area)
            .toList();
        List<LiveReg> valoresToShow = [];
        // if (valores.length > endList) {
        //   valoresToShow = valores.sublist(0, endList);
        // } else {
        valoresToShow = valores;
        // }

        return Scaffold(
          appBar: AppBar(
            title: const Text("Gráfica (Millones de pesos)"),
            actions: [
              const Gap(5),
              ElevatedButton(
                onPressed: () {
                  // print(
                  //     'state.vistaContratoList!.list ${state.proyeccionList!.list.length}');
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
                      flex: 6,
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
                LegendsListWidget(
                  legends: [
                    // Legend(
                    //     'Contratado', const Color.fromRGBO(65, 185, 230, 1.0)),
                    Legend('BDG', const Color.fromRGBO(5, 85, 250, 1.0)),
                    // Legend('Vencido', const Color.fromRGBO(255, 70, 135, 1.0)),
                    Legend('LIVE', const Color.fromRGBO(0, 140, 90, 1.0)),
                  ],
                ),
                // const Gap(10),
                // const Gap(5),
                // const Gap(5),
                Expanded(
                  child: GraficaLinea(
                    list: valoresToShow,
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

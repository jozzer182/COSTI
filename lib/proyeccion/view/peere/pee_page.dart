import 'package:costii/resources/constants/especialidades.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../bloc/main_bloc.dart';
import '../../../hovip_module/proyectos/model/proyectos_reg.dart';
import '../../../resources/descarga_hojas.dart';
import '../../../resources/titulo.dart';
import '../../model/proyeccion_reg_esp.dart';
import 'pee_row_edit.dart';
import 'pee_row_total.dart';
import 'pegar_excel/boton_pegar_excel.dart';

class ProyeccionEspEdicionPage extends StatefulWidget {
  final bool esProyecto;
  const ProyeccionEspEdicionPage({
    required this.esProyecto,
    super.key,
  });

  @override
  State<ProyeccionEspEdicionPage> createState() =>
      _ProyeccionEspEdicionPageState();
}

class _ProyeccionEspEdicionPageState extends State<ProyeccionEspEdicionPage> {
  final ScrollController _controller = ScrollController();
  late List<ToCelda> titulos;
  late List<ProyeccionRegEsp> valoresToShow;
  late String proyecto;
  late List<ProyectosReg> proyectos;
  int endList = 70;
  bool activarBusqueda = false;
  String naturaleza = '';
  String especialidad = '';
  List<String> naturalezas = ['', 'MATERIALES', 'SERVICIOS', 'OTROS COSTOS'];
  List<String> especialidades = [
    '',
    ...serviciosEsp,
    ...materialEsp,
    ...otrosEsp
  ];
  _onScroll() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      // setState(() {
      //   endList += 70;
      // });
    }
  }

  get toggleBusqueda {
    setState(() {
      activarBusqueda = !activarBusqueda;
    });
  }

  @override
  void initState() {
    _controller.addListener(_onScroll);
    if (widget.esProyecto) {
      titulos = context.read<MainBloc>().state.pEdit?.celdas ?? [];
    } else {
      titulos = context.read<MainBloc>().state.pEdit?.celdasFiltro ?? [];
    }
    valoresToShow = context.read<MainBloc>().state.pEdit?.list ?? [];
    if (naturaleza.isNotEmpty) {
      valoresToShow =
          valoresToShow.where((e) => e.naturaleza == naturaleza).toList();
    }
    proyecto =
        context.read<MainBloc>().state.pEdit?.proyectosReg.proyecto ?? '';
    proyectos = context.read<MainBloc>().state.pEdit?.proyectosList ?? [];

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  doState(BuildContext contex) => setState(() {});

  @override
  Widget build(BuildContext context) {
    if (proyecto.isEmpty && widget.esProyecto) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Proyecto No Habilitado para proyectar'),
        ),
        body: const Center(
          child: SelectableText(
              'Si necesita crear una proyección para este proyecto comuníquese con Fabio Rodríguez (fabio.rodriguez@enel.com) e indíquele al solicitud. '),
        ),
      );
    }

    if (proyectos.isEmpty && !widget.esProyecto) {
      return Scaffold(
        appBar: AppBar(
          title:
              const Text('No se Encontraron proyectos para editar proyección'),
        ),
        body: const Center(
          child: SelectableText(
              'Si necesita crear una proyección para estos proyectos comuníquese con Fabio Rodríguez (fabio.rodriguez@enel.com) e indíquele al solicitud. '),
        ),
      );
    }

    if (valoresToShow.isEmpty || titulos.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Proyecto No Habilitado para proyectar'),
        ),
        body: const Center(
          child: SelectableText(
              'Si necesita crear una proyección para este proyecto comuníquese con Fabio Rodríguez (fabio.rodriguez@enel.com) e indíquele al solicitud. '),
        ),
      );
    }

    if (naturaleza == 'MATERIALES') especialidades = ['', ...materialEsp];
    if (naturaleza == 'SERVICIOS') especialidades = ['', ...serviciosEsp];
    if (naturaleza == 'OTROS COSTOS') especialidades = ['', ...otrosEsp];

    return Scaffold(
      appBar: AppBar(
        title: widget.esProyecto
            ? Text(
                "${proyecto.toUpperCase()} | Edición Proyección Especialidad (Pesos)")
            : const Text("MASIVO | Edición Proyección Especialidad (Pesos)"),
        actions: [
          Tooltip(
            message: 'Experimental',
            child: ElevatedButton(
              onPressed: () {
                toggleBusqueda;
              },
              child: Text(
                activarBusqueda ? 'Desactivar\nFiltros' : 'Activar\nFiltros',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Gap(5),
          PeeBotonPegarExcel(esProyecto: widget.esProyecto),
          const Gap(5),
          ElevatedButton(
            onPressed: () {
              List<Map<String, dynamic>> datos =
                  valoresToShow.map((e) => e.toMapPlanilla()).toList();
              DescargaHojas().ahoraMap(
                datos: datos,
                nombre: widget.esProyecto
                    ? "Plantilla Proyección Especialidad ${proyecto.toUpperCase()}"
                    : "Plantilla Proyección Especialidad | MASIVO",
              );
            },
            child: const Text(
              'Descargar Plantilla',
              textAlign: TextAlign.center,
            ),
          ),
          const Gap(5),
          BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              bool hayCambios = state.pCopy?.calculo.hayCambios ?? false;
              return ElevatedButton(
                onPressed: hayCambios
                    ? () {
                        showDialog(
                          context: context,
                          builder: (c) {
                            return AlertDialog(
                              title:
                                  const Text("Esta seguro que desea continuar"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    context
                                        .read<MainBloc>()
                                        .proyeccionEspEdit
                                        .save;
                                    while (Navigator.of(context).canPop()) {
                                      Navigator.of(context).pop();
                                    }
                                  },
                                  child: const Text('Continuar'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, false);
                                  },
                                  child: const Text('Cancelar'),
                                )
                              ],
                            );
                          },
                        );
                      }
                    : null,
                child: const Text('Guardar'),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            if (!activarBusqueda) const ProyAcumRow(),
            if (activarBusqueda)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DropdownMenu(
                    dropdownMenuEntries: naturalezas
                        .map((e) => DropdownMenuEntry(
                              label: e,
                              value: e,
                            ))
                        .toList(),
                    label: const Text('Naturaleza'),
                    onSelected: (value) {
                      setState(() {
                        naturaleza = value.toString();
                        especialidad = '';
                      });
                    },
                  ),
                  DropdownMenu(
                    dropdownMenuEntries: especialidades
                        .map((e) => DropdownMenuEntry(
                              label: e,
                              value: e,
                            ))
                        .toList(),
                    label: const Text('Especialidad'),
                    onSelected: (value) {
                      setState(() {
                        especialidad = value.toString();
                      });
                    },
                  ),
                ],
              ),
            const Gap(5),
            Row(
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
            const Gap(5),
            Expanded(
              child: ListView.builder(
                itemCount: valoresToShow.length,
                itemBuilder: (c, index) {
                  if (index == endList) {
                    return const Gap(10);
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: PeeRowEdit(
                      index,
                      esProyecto: widget.esProyecto,
                      naturaleza: naturaleza,
                      especialidad: especialidad,
                      key: UniqueKey(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

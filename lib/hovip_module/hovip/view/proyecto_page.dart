import 'package:costii/hovip_module/ejecutores/view/ejecutores_section.dart';
import 'package:costii/hovip_module/fem/view/fem_section.dart';
import 'package:costii/hovip_module/proyectos/model/proyectos_reg.dart';
import 'package:costii/hovip_module/proyectos/view/clasificacion_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/main_bloc.dart';

class HovipProyectoPage extends StatefulWidget {
  const HovipProyectoPage({super.key});

  @override
  State<HovipProyectoPage> createState() => _HovipProyectoPageState();
}

class _HovipProyectoPageState extends State<HovipProyectoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state.hovipReg == null) {
          return const Center(child: CircularProgressIndicator());
        }
        ProyectosReg proyecto = state.hovipReg!.proyecto;
        return Scaffold(
          appBar: AppBar(
            title: SelectableText('${proyecto.idsap} | ${proyecto.proyecto}'),
          ),
          body: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: double.infinity),
                ClasificacionSection(),
                EjecutoresSection(),
                FemSection(),
              ],
            ),
          ),
        );
      },
    );
  }
}

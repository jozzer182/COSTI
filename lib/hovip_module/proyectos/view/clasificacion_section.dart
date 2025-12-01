import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/main_bloc.dart';
import '../../hovip/view/section_card.dart';
import '../../hovip/view/simple_label.dart';
import '../model/proyectos_reg.dart';

class ClasificacionSection extends StatefulWidget {
  const ClasificacionSection({super.key});

  @override
  State<ClasificacionSection> createState() => _ClasificacionSectionState();
}

class _ClasificacionSectionState extends State<ClasificacionSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        ProyectosReg proyecto = state.hovipReg!.proyecto;
        bool desMayor60 = proyecto.irdes.length >
            60; //Si es mayor a 60 caracteres se muestra en otra linea

        return SectionCard(
          title: "CLASIFICACIÓN",
          icono: Icono.none,
          accion: () {},
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SimpleLabel(title: "Id", content: proyecto.id),
                SimpleLabel(title: "Id SAP", content: proyecto.idsap),
                SimpleLabel(
                  title: "Nombre Corto",
                  content: proyecto.nombrecorto,
                ),
                SimpleLabel(
                  title: "Subgerencia",
                  content: proyecto.subgerencia,
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SimpleLabel(
                  title: "Investment Reason Code",
                  content: proyecto.ir,
                ),
                if (!desMayor60)
                  SimpleLabel(
                    title: "Investment Reason",
                    content: proyecto.irdes,
                  ),
              ],
            ),
            if (desMayor60)
              SimpleLabel(
                title: "Investment Reason",
                content: proyecto.irdes,
              ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SimpleLabel(
                  title: "Proyecto Especial",
                  content: proyecto.pe,
                ),
                SimpleLabel(
                  title: "PCLUSTERS",
                  content: proyecto.pclusters,
                ),
              ],
            ),
            const Spacer(),
            SimpleLabel(
              title: "MacroCategoría",
              content: proyecto.macroc,
            ),
            const Spacer(),
          ],
        );
      },
    );
  }
}
